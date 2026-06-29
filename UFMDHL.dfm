inherited FMDHL: TFMDHL
  Left = 400
  Top = 112
  Width = 1024
  Height = 766
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Transportistas DHL'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1014
    Height = 713
    inherited TBMain: TLFToolBar
      Width = 1010
      inherited NavMain: THYMNavigator
        DataSource = DMDHL.DSxDHLTransportista
        Hints.Strings = ()
        EditaControl = DBECloseTime
        InsertaControl = DBEAcreedor
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
      object BPruebasAPI: TButton
        Left = 319
        Top = 0
        Width = 75
        Height = 22
        Caption = 'Pruebas API'
        TabOrder = 2
        OnClick = BPruebasAPIClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1010
      Height = 683
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 1002
          Height = 655
          inherited G2KTableLoc: TG2KTBLoc
            Left = 32
            Top = 168
            DataSource = DMDHL.DSxDHLTransportista
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'DHL_CONFIGURACION'
            CampoNum = 'ACREEDOR'
            CampoStr = 'CODIGO_INTEGRACION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ACREEDOR')
          end
          object LAcreedor: TLFLabel
            Left = 57
            Top = 27
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Acreedor'
          end
          object LCloseTime: TLFLabel
            Left = 47
            Top = 471
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Close Time'
          end
          object LPickupLocation: TLFLabel
            Left = 58
            Top = 492
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Location'
          end
          object LPickupLocationType: TLFLabel
            Left = 30
            Top = 514
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Location Type'
          end
          object LSpecialInstructionsValue: TLFLabel
            Left = 13
            Top = 538
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Instrucciones esp.'
          end
          object LRemark: TLFLabel
            Left = 32
            Top = 584
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas Pickup'
          end
          object LConfiguracionAPI: TLFLabel
            Left = 4
            Top = 49
            Width = 981
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Config. API'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LConfiguracionShipper: TLFLabel
            Left = 4
            Top = 140
            Width = 485
            Height = 13
            AutoSize = False
            Caption = 'Config. Shipper'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LContactCompayName: TLFLabel
            Left = 17
            Top = 404
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre Empresa'
          end
          object LContactPhone: TLFLabel
            Left = 56
            Top = 360
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Telefono'
          end
          object LAddress1: TLFLabel
            Left = 45
            Top = 248
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion 1'
          end
          object LPostCode: TLFLabel
            Left = 44
            Top = 162
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Postal'
          end
          object LCountry: TLFLabel
            Left = 79
            Top = 205
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pais'
          end
          object LCity: TLFLabel
            Left = 66
            Top = 183
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ciudad'
          end
          object LConfiguracionOtros: TLFLabel
            Left = 4
            Top = 449
            Width = 981
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Otros'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LWSURL: TLFLabel
            Left = 573
            Top = 70
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'URL'
          end
          object LunitOfMeasurement: TLFLabel
            Left = 38
            Top = 606
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unid. Medida'
          end
          object SBDirectorioCopiaEtiqueta: TSpeedButton
            Tag = 2
            Left = 962
            Top = 624
            Width = 23
            Height = 20
            Anchors = [akTop, akRight]
            OnClick = SBDirectorioCopiaEtiquetaClick
          end
          object LGestion: TLFLabel
            Left = 4
            Top = 5
            Width = 981
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Gestion'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LProvincia: TLFLabel
            Left = 55
            Top = 227
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Provincia'
          end
          object LAddress2: TLFLabel
            Left = 46
            Top = 270
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion 2'
          end
          object LAddres3: TLFLabel
            Left = 46
            Top = 292
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion 3'
          end
          object LCountyName: TLFLabel
            Left = 56
            Top = 314
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Condado'
          end
          object LDBEContactEmail: TLFLabel
            Left = 73
            Top = 338
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Email'
          end
          object LContactMobilePhone: TLFLabel
            Left = 73
            Top = 382
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Movil'
          end
          object LContactFullName: TLFLabel
            Left = 61
            Top = 426
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LConfigPickupDetails: TLFLabel
            Left = 500
            Top = 140
            Width = 485
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Config. Pickup Details'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LPUContactCompayName: TLFLabel
            Left = 513
            Top = 404
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre Empresa'
          end
          object LPUContactPhone: TLFLabel
            Left = 552
            Top = 360
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Telefono'
          end
          object LPUAddress1: TLFLabel
            Left = 541
            Top = 248
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion 1'
          end
          object LPUPostCode: TLFLabel
            Left = 540
            Top = 162
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Postal'
          end
          object LPUCountry: TLFLabel
            Left = 575
            Top = 205
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pais'
          end
          object LPUCity: TLFLabel
            Left = 562
            Top = 183
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ciudad'
          end
          object LPUProvincia: TLFLabel
            Left = 551
            Top = 227
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Provincia'
          end
          object LPUAddress2: TLFLabel
            Left = 542
            Top = 270
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion 2'
          end
          object LPUAddress3: TLFLabel
            Left = 542
            Top = 292
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion 3'
          end
          object LPUCountyName: TLFLabel
            Left = 552
            Top = 314
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Condado'
          end
          object LPUContactEmail: TLFLabel
            Left = 569
            Top = 338
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Email'
          end
          object LPUContactMobilePhone: TLFLabel
            Left = 569
            Top = 382
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Movil'
          end
          object LPUContactFullName: TLFLabel
            Left = 557
            Top = 426
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LAccountNumber: TLFLabel
            Left = 18
            Top = 71
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Account Number'
          end
          object LAccountTypeCode: TLFLabel
            Left = 31
            Top = 92
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Account Type'
          end
          object LSpecialInstructionsType: TLFLabel
            Left = 32
            Top = 558
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Inst. esp. Tipo'
          end
          object LRutaCopiaEtiqueta: TLFLabel
            Left = 6
            Top = 629
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta Copia Etiqueta'
          end
          object LUsername: TLFLabel
            Left = 540
            Top = 93
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'LUsername'
          end
          object LWSPassword: TLFLabel
            Left = 548
            Top = 115
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Password'
          end
          object DBECloseTime: TLFDbedit
            Left = 104
            Top = 467
            Width = 383
            Height = 21
            DataField = 'PICKUP_CLOSETIME'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 33
          end
          object DBEPickupLocation: TLFDbedit
            Left = 104
            Top = 489
            Width = 383
            Height = 21
            DataField = 'PICKUP_LOCATION'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 34
          end
          object DBESpecialInstructionsValue: TLFDbedit
            Left = 104
            Top = 533
            Width = 383
            Height = 21
            DataField = 'PICKUP_SPECIALINST_VALUE'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 36
          end
          object DBERemark: TLFDbedit
            Left = 104
            Top = 579
            Width = 383
            Height = 21
            DataField = 'PICKUP_REMARK'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 38
          end
          object ETituloAcreedor: TLFEdit
            Left = 178
            Top = 22
            Width = 309
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEAcreedor: TDBEditFind2000
            Left = 104
            Top = 22
            Width = 73
            Height = 21
            Color = clAqua
            DataField = 'ACREEDOR'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 0
            OnChange = DBEAcreedorChange
            OnDblClick = DBEAcreedorDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ACREEDORES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ACREEDOR'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'TIPO=7'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ACREEDOR')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEContactCompayName: TLFDbedit
            Left = 104
            Top = 399
            Width = 383
            Height = 21
            DataField = 'PICKUP_SH_CONTACT_COMPANYNAME'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 18
          end
          object DBEContactPhone: TLFDbedit
            Left = 104
            Top = 355
            Width = 383
            Height = 21
            DataField = 'PICKUP_SH_CONTACT_PHONE'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 16
          end
          object DBEAddress1: TLFDbedit
            Left = 104
            Top = 245
            Width = 383
            Height = 21
            DataField = 'PICKUP_SHIPPER_ADDRESSLINE1'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 11
          end
          object DBEPostCode: TLFDbedit
            Left = 104
            Top = 158
            Width = 383
            Height = 21
            DataField = 'PICKUP_SHIPPER_POSTALCODE'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 7
          end
          object DBECountry: TLFDbedit
            Left = 104
            Top = 201
            Width = 383
            Height = 21
            DataField = 'PICKUP_SHIPPER_COUNTRYCODE'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 9
          end
          object DBECity: TLFDbedit
            Left = 104
            Top = 179
            Width = 383
            Height = 21
            DataField = 'PICKUP_SHIPPER_CITYNAME'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 8
          end
          object DBEProvincia: TLFDbedit
            Left = 104
            Top = 223
            Width = 383
            Height = 21
            DataField = 'PICKUP_SHIPPER_PROVINCECODE'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 10
          end
          object DBEAddress2: TLFDbedit
            Left = 104
            Top = 267
            Width = 383
            Height = 21
            DataField = 'PICKUP_SHIPPER_ADDRESSLINE2'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 12
          end
          object DBEAddress3: TLFDbedit
            Left = 104
            Top = 289
            Width = 383
            Height = 21
            DataField = 'PICKUP_SHIPPER_ADDRESSLINE3'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 13
          end
          object DBECountyName: TLFDbedit
            Left = 104
            Top = 311
            Width = 383
            Height = 21
            DataField = 'PICKUP_SHIPPER_COUNTYNAME'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 14
          end
          object DBEContactEmail: TLFDbedit
            Left = 104
            Top = 333
            Width = 383
            Height = 21
            DataField = 'PICKUP_SH_CONTACT_EMAIL'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 15
          end
          object DBEContactMobilePhone: TLFDbedit
            Left = 104
            Top = 377
            Width = 383
            Height = 21
            DataField = 'PICKUP_SH_CONTACT_MOBILEPHONE'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 17
          end
          object DBEContactFullName: TLFDbedit
            Left = 104
            Top = 421
            Width = 383
            Height = 21
            DataField = 'PICKUP_SH_CONTACT_FULLNAME'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 19
          end
          object DBEPUContactCompayName: TLFDbedit
            Left = 600
            Top = 399
            Width = 383
            Height = 21
            DataField = 'PICKUP_DE_CONTACT_COMPANYNAME'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 31
          end
          object DBEPUContactPhone: TLFDbedit
            Left = 600
            Top = 355
            Width = 383
            Height = 21
            DataField = 'PICKUP_DE_CONTACT_PHONE'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 29
          end
          object DBEPUAddress1: TLFDbedit
            Left = 600
            Top = 245
            Width = 383
            Height = 21
            DataField = 'PICKUP_DETAILS_ADDRESSLINE1'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 24
          end
          object DBEPUPostCode: TLFDbedit
            Left = 600
            Top = 158
            Width = 383
            Height = 21
            DataField = 'PICKUP_DETAILS_POSTALCODE'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 20
          end
          object DBEPUCountry: TLFDbedit
            Left = 600
            Top = 201
            Width = 383
            Height = 21
            DataField = 'PICKUP_DETAILS_COUNTRYCODE'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 22
          end
          object DBEPUCity: TLFDbedit
            Left = 600
            Top = 179
            Width = 383
            Height = 21
            DataField = 'PICKUP_DETAILS_CITYNAME'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 21
          end
          object DBEPUProvincia: TLFDbedit
            Left = 600
            Top = 223
            Width = 383
            Height = 21
            DataField = 'PICKUP_DETAILS_PROVINCECODE'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 23
          end
          object DBEPUAddress2: TLFDbedit
            Left = 600
            Top = 267
            Width = 383
            Height = 21
            DataField = 'PICKUP_DETAILS_ADDRESSLINE2'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 25
          end
          object DBEPUAddress3: TLFDbedit
            Left = 600
            Top = 289
            Width = 383
            Height = 21
            DataField = 'PICKUP_DETAILS_ADDRESSLINE3'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 26
          end
          object DBEPUCountyName: TLFDbedit
            Left = 600
            Top = 311
            Width = 383
            Height = 21
            DataField = 'PICKUP_DETAILS_COUNTYNAME'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 27
          end
          object DBEPUContactEmail: TLFDbedit
            Left = 600
            Top = 333
            Width = 383
            Height = 21
            DataField = 'PICKUP_DE_CONTACT_EMAIL'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 28
          end
          object DBEPUContactMobilePhone: TLFDbedit
            Left = 600
            Top = 377
            Width = 383
            Height = 21
            DataField = 'PICKUP_DE_CONTACT_MOBILEPHONE'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 30
          end
          object DBEPUContactFullName: TLFDbedit
            Left = 600
            Top = 421
            Width = 383
            Height = 21
            DataField = 'PICKUP_DE_CONTACT_FULLNAME'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 32
          end
          object DBEAccountNumber: TLFDbedit
            Left = 104
            Top = 67
            Width = 383
            Height = 21
            DataField = 'ACCOUNT_NUMBER'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 2
          end
          object DBCBPickupLocationType: TDBComboBox
            Left = 104
            Top = 511
            Width = 383
            Height = 21
            DataField = 'PICKUP_LOCATIONTYPE'
            DataSource = DMDHL.DSxDHLTransportista
            ItemHeight = 13
            Items.Strings = (
              'business'
              'residence')
            TabOrder = 35
          end
          object DBCBAccountTypeCode: TDBComboBox
            Left = 104
            Top = 89
            Width = 383
            Height = 21
            DataField = 'ACCOUNT_TYPECODE'
            DataSource = DMDHL.DSxDHLTransportista
            ItemHeight = 13
            Items.Strings = (
              'shipper'
              'payer'
              'duties-taxes')
            TabOrder = 3
          end
          object DBCBSpecialInstructionsType: TDBComboBox
            Left = 105
            Top = 555
            Width = 383
            Height = 21
            DataField = 'PICKUP_SPECIALINST_TYPECODE'
            DataSource = DMDHL.DSxDHLTransportista
            ItemHeight = 13
            Items.Strings = (
              'TBD')
            TabOrder = 37
          end
          object DBCBunitOfMeasurement: TDBComboBox
            Left = 105
            Top = 601
            Width = 383
            Height = 21
            DataField = 'UNITOFMEASUREMENT'
            DataSource = DMDHL.DSxDHLTransportista
            ItemHeight = 13
            Items.Strings = (
              'metric'
              'imperial')
            TabOrder = 39
          end
          object ERutaCopiaEtiqueta: TLFEdit
            Left = 104
            Top = 624
            Width = 857
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 40
          end
          object DBCBWSURL: TDBComboBox
            Left = 600
            Top = 67
            Width = 383
            Height = 21
            DataField = 'WS_URL'
            DataSource = DMDHL.DSxDHLTransportista
            ItemHeight = 13
            Items.Strings = (
              'api-mock.dhl.com/mydhlapi'
              'express.api.dhl.com/mydhlapi/test'
              'express.api.dhl.com/mydhlapi')
            TabOrder = 4
          end
          object DBEWSUserName: TLFDbedit
            Left = 600
            Top = 89
            Width = 383
            Height = 21
            DataField = 'WS_USERNAME'
            DataSource = DMDHL.DSxDHLTransportista
            TabOrder = 5
          end
          object DBEWSPassword: TLFDbedit
            Left = 600
            Top = 111
            Width = 383
            Height = 21
            DataField = 'WS_PASSWORD'
            DataSource = DMDHL.DSxDHLTransportista
            PasswordChar = '*'
            TabOrder = 6
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1002
          Height = 655
          DataSource = DMDHL.DSxDHLTransportista
          Columns = <
            item
              Expanded = False
              FieldName = 'ACREEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACCOUNT_NUMBER'
              Width = 111
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 713
    Width = 1014
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
