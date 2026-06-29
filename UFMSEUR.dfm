inherited FMSEUR: TFMSEUR
  Left = 332
  Top = 112
  Height = 766
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Transportistas SEUR'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 713
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBECodigoIntegracion
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
      Height = 683
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 655
          inherited G2KTableLoc: TG2KTBLoc
            Left = 32
            Top = 168
            Tabla_a_buscar = 'SEUR_CONFIGURACION'
            CampoNum = 'ACREEDOR'
            CampoStr = 'CODIGO_INTEGRACION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ACREEDOR')
          end
          object LAcreedor: TLFLabel
            Left = 57
            Top = 30
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Acreedor'
          end
          object LCodigoIntegracion: TLFLabel
            Left = 7
            Top = 510
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo Integracion'
          end
          object LCodigoCliente: TLFLabel
            Left = 28
            Top = 533
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo Cliente'
          end
          object LNumeroBulto: TLFLabel
            Left = 32
            Top = 555
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Numero Bulto'
          end
          object LLimiteInferiorBulto: TLFLabel
            Left = 7
            Top = 575
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Limite Inferior Bulto'
          end
          object LLimiteSuperiorBulto: TLFLabel
            Left = 0
            Top = 597
            Width = 96
            Height = 13
            Alignment = taRightJustify
            Caption = 'Limite Superior Bulto'
          end
          object LConfiguracionAPI: TLFLabel
            Left = 4
            Top = 55
            Width = 484
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
          object LGrantType: TLFLabel
            Left = 43
            Top = 79
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grant Type'
          end
          object LCLientId: TLFLabel
            Left = 58
            Top = 101
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Client Id'
          end
          object LClientSecret: TLFLabel
            Left = 36
            Top = 121
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Client Secret'
          end
          object LUserName: TLFLabel
            Left = 43
            Top = 144
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'User Name'
          end
          object LPassword: TLFLabel
            Left = 50
            Top = 164
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Password'
          end
          object LConfiguracionCliente: TLFLabel
            Left = 4
            Top = 235
            Width = 484
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Config. Cliente'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LCCC: TLFLabel
            Left = 7
            Top = 259
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Cta. Contable'
          end
          object LIdNumber: TLFLabel
            Left = 47
            Top = 280
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id Number'
          end
          object LBussinesUnit: TLFLabel
            Left = 32
            Top = 302
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bussines Unit'
          end
          object LConfiguracionSender: TLFLabel
            Left = 4
            Top = 328
            Width = 484
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Config. Sender'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LName: TLFLabel
            Left = 61
            Top = 352
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LPhone: TLFLabel
            Left = 56
            Top = 374
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Telefono'
          end
          object LStreetName: TLFLabel
            Left = 75
            Top = 394
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Calle'
          end
          object LPostCode: TLFLabel
            Left = 44
            Top = 417
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Postal'
          end
          object LCountry: TLFLabel
            Left = 79
            Top = 439
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pais'
          end
          object LCity: TLFLabel
            Left = 66
            Top = 460
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ciudad'
          end
          object LConfiguracionOtros: TLFLabel
            Left = 4
            Top = 486
            Width = 484
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
          object LToken: TLFLabel
            Left = 4
            Top = 188
            Width = 484
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Token'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LExpiracion: TLFLabel
            Left = 53
            Top = 210
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Expiracion'
          end
          object LRutaCopiaEtiqueta: TLFLabel
            Left = 6
            Top = 619
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta Copia Etiqueta'
          end
          object SBDirectorioCopiaEtiqueta: TSpeedButton
            Tag = 2
            Left = 467
            Top = 615
            Width = 23
            Height = 21
            Anchors = [akTop, akRight]
            OnClick = SBDirectorioCopiaEtiquetaClick
          end
          object LGestion: TLFLabel
            Left = 4
            Top = 8
            Width = 484
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
          object DBECodigoIntegracion: TLFDbedit
            Left = 104
            Top = 504
            Width = 383
            Height = 21
            DataField = 'CODIGO_INTEGRACION'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 18
          end
          object DBECodigoCliente: TLFDbedit
            Left = 104
            Top = 526
            Width = 383
            Height = 21
            DataField = 'CODIGO_CLIENTE'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 19
          end
          object DBENumeroBulto: TLFDbedit
            Left = 104
            Top = 548
            Width = 383
            Height = 21
            DataField = 'NUMERO_BULTO'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 20
          end
          object DBELimiteInferiorBulto: TLFDbedit
            Left = 104
            Top = 570
            Width = 383
            Height = 21
            DataField = 'LIMITE_BULTO_INFERIOR'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 21
          end
          object DBELimiteSuperiorBulto: TLFDbedit
            Left = 104
            Top = 592
            Width = 383
            Height = 21
            DataField = 'LIMITE_BULTO_SUPERIOR'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 22
          end
          object ETituloAcreedor: TLFEdit
            Left = 178
            Top = 25
            Width = 309
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEAcreedor: TDBEditFind2000
            Left = 104
            Top = 25
            Width = 73
            Height = 21
            Color = clAqua
            DataField = 'ACREEDOR'
            DataSource = DMSEUR.DSxSEURTransportista
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
          object DBEGrantType: TLFDbedit
            Left = 104
            Top = 74
            Width = 383
            Height = 21
            DataField = 'GRANT_TYPE'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 2
          end
          object DBECLientId: TLFDbedit
            Left = 104
            Top = 96
            Width = 383
            Height = 21
            DataField = 'CLIENT_ID'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 3
          end
          object DBEClientSecret: TLFDbedit
            Left = 104
            Top = 118
            Width = 383
            Height = 21
            DataField = 'CLIENT_SECRET'
            DataSource = DMSEUR.DSxSEURTransportista
            PasswordChar = '*'
            TabOrder = 4
          end
          object DBEUserName: TLFDbedit
            Left = 104
            Top = 140
            Width = 383
            Height = 21
            DataField = 'USERNAME'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 5
          end
          object DBEPassword: TLFDbedit
            Left = 104
            Top = 160
            Width = 383
            Height = 21
            DataField = 'USER_PASSWORD'
            DataSource = DMSEUR.DSxSEURTransportista
            PasswordChar = '*'
            TabOrder = 6
          end
          object DBECCC: TLFDbedit
            Left = 104
            Top = 254
            Width = 383
            Height = 21
            DataField = 'CCC'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 9
          end
          object DBEIdNumber: TLFDbedit
            Left = 104
            Top = 276
            Width = 383
            Height = 21
            DataField = 'ID_NUMBER'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 10
          end
          object DBEBussinesUnit: TLFDbedit
            Left = 104
            Top = 298
            Width = 383
            Height = 21
            DataField = 'BUSINESS_UNIT'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 11
          end
          object DBEName: TLFDbedit
            Left = 104
            Top = 347
            Width = 383
            Height = 21
            DataField = 'SENDER_NAME'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 12
          end
          object DBEPhone: TLFDbedit
            Left = 104
            Top = 369
            Width = 383
            Height = 21
            DataField = 'SENDER_PHONE'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 13
          end
          object DBEStreetName: TLFDbedit
            Left = 104
            Top = 391
            Width = 383
            Height = 21
            DataField = 'SENDER_ADDR_STREET'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 14
          end
          object DBEPostCode: TLFDbedit
            Left = 104
            Top = 413
            Width = 383
            Height = 21
            DataField = 'SENDER_ADDR_POSTCODE'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 15
          end
          object DBECountry: TLFDbedit
            Left = 104
            Top = 435
            Width = 383
            Height = 21
            DataField = 'SENDER_ADDR_COUNTRY'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 16
          end
          object DBECity: TLFDbedit
            Left = 104
            Top = 456
            Width = 383
            Height = 21
            DataField = 'SENDER_ADDR_CITY'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 17
          end
          object DBEAcessToken: TLFDbedit
            Left = 104
            Top = 183
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clLime
            DataField = 'ACCESS_TOKEN'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 7
          end
          object DBEExpiracion: TLFDbedit
            Left = 104
            Top = 205
            Width = 383
            Height = 21
            DataField = 'FECHA_EXPIRACION'
            DataSource = DMSEUR.DSxSEURTransportista
            TabOrder = 8
          end
          object ERutaCopiaEtiqueta: TLFEdit
            Left = 104
            Top = 614
            Width = 361
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 23
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 624
          Columns = <
            item
              Expanded = False
              FieldName = 'ACREEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_INTEGRACION'
              Width = 111
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_CLIENTE'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_BULTO'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIMITE_BULTO_INFERIOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIMITE_BULTO_SUPERIOR'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 713
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
