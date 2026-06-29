inherited FMSincronizacionSkrit: TFMSincronizacionSkrit
  Left = 308
  Top = 204
  Width = 1051
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Sincronizacion Skrit'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Top = 25
    Width = 1041
    Height = 296
    inherited TBMain: TLFToolBar
      Width = 1037
      inherited NavMain: THYMNavigator
        DataSource = DMSincronizacionSkrit.DSxCabecera
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      object TBSep1: TToolButton
        Left = 319
        Top = 0
        Width = 8
        ImageIndex = 25
        Style = tbsSeparator
      end
      object TBSincronizar: TToolButton
        Left = 327
        Top = 0
        Action = ASincronizar
      end
      object PNLUltimaSincronizacion: TLFPanel
        Left = 350
        Top = 0
        Width = 259
        Height = 22
        TabOrder = 2
        object DBTUltimaSincronizacion: TDBText
          Left = 121
          Top = 4
          Width = 128
          Height = 13
          AutoSize = True
          DataField = 'FECHA_ULTIMA_SINC'
          DataSource = DMSincronizacionSkrit.DSQMConfiguracion
        end
        object LUltimaSincronizacion: TLFLabel
          Left = 10
          Top = 4
          Width = 101
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ultima Sincronizacion'
        end
      end
    end
    inherited PCMain: TLFPageControl
      Top = 51
      Width = 1037
      Height = 243
      inherited TSFicha: TTabSheet
        object SBADocumento: TSpeedButton [0]
          Left = 523
          Top = 4
          Width = 145
          Height = 22
          GroupIndex = -1
          OnDblClick = SBADocumentoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1029
          Height = 215
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'REGISTRATION')
            DataSource = DMSincronizacionSkrit.DSxCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SKRIT_DELIVERY_NOTES'
            CampoNum = 'CODE'
            CampoStr = 'DN_DATE'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CODE')
          end
          object LSerie: TLFLabel
            Left = 52
            Top = 3
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LCode: TLFLabel
            Left = 22
            Top = 25
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo Alb.'
          end
          object LDate: TLFLabel
            Left = 46
            Top = 47
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LWarehouse: TLFLabel
            Left = 35
            Top = 69
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almacen'
          end
          object LRegistration: TLFLabel
            Left = 37
            Top = 91
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Registro'
          end
          object LOrderedBy: TLFLabel
            Left = 7
            Top = 113
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ordernado Por'
          end
          object LOrderNumber: TLFLabel
            Left = 24
            Top = 135
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Orden'
          end
          object LObservations: TLFLabel
            Left = 5
            Top = 157
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observaciones'
          end
          object LTotal: TLFLabel
            Left = 548
            Top = 187
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total'
          end
          object LBaseImponible: TLFLabel
            Left = 4
            Top = 187
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Imponible'
          end
          object LIVA: TLFLabel
            Left = 331
            Top = 187
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'IVA'
          end
          object LCuotaIVA: TLFLabel
            Left = 427
            Top = 187
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'IVA'
          end
          object LImpuesto: TLFLabel
            Left = 185
            Top = 187
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Impuesto'
          end
          object LDestino: TLFLabel
            Left = 454
            Top = 3
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Doc. Destino'
          end
          object DBESerie: TLFDbedit
            Left = 80
            Top = 0
            Width = 121
            Height = 21
            DataField = 'SERIE'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 0
          end
          object DBECode: TLFDbedit
            Left = 80
            Top = 22
            Width = 121
            Height = 21
            DataField = 'CODE'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 1
          end
          object DBDEDate: TLFDBDateEdit
            Left = 80
            Top = 44
            Width = 121
            Height = 21
            DataField = 'DN_DATE'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBEWarehouse: TLFDbedit
            Left = 80
            Top = 66
            Width = 121
            Height = 21
            DataField = 'WAREHOUSE'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 3
          end
          object DBERegistration: TLFDbedit
            Left = 80
            Top = 88
            Width = 121
            Height = 21
            DataField = 'REGISTRATION'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 4
          end
          object DBEOrderedBy: TLFDbedit
            Left = 80
            Top = 110
            Width = 121
            Height = 21
            DataField = 'ORDEREDBY'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 5
          end
          object DBEOrderNumber: TLFDbedit
            Left = 80
            Top = 132
            Width = 121
            Height = 21
            DataField = 'ORDERNUMBER'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 6
          end
          object DBEObservations: TLFDbedit
            Left = 80
            Top = 154
            Width = 585
            Height = 21
            DataField = 'OBSERVATIONS'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 7
          end
          object DBETotal: TLFDbedit
            Left = 576
            Top = 184
            Width = 89
            Height = 21
            Color = clMoneyGreen
            DataField = 'TOTAL'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 12
          end
          object DBEBaseImponible: TLFDbedit
            Left = 80
            Top = 184
            Width = 89
            Height = 21
            Color = clMoneyGreen
            DataField = 'TOTAL'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 8
          end
          object DBEIVA: TLFDbedit
            Left = 352
            Top = 184
            Width = 65
            Height = 21
            Color = clMoneyGreen
            DataField = 'ENTAJEIVA'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 10
          end
          object DBECuotaIVA: TLFDbedit
            Left = 448
            Top = 184
            Width = 89
            Height = 21
            Color = clMoneyGreen
            DataField = 'PROMPTPAYMENT'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 11
          end
          object DBEImpuesto: TLFDbedit
            Left = 232
            Top = 184
            Width = 89
            Height = 21
            Color = clMoneyGreen
            DataField = 'PROMPTPAYMENT'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 9
          end
          object DBEDestino: TLFDbedit
            Left = 520
            Top = 0
            Width = 145
            Height = 21
            Color = clAqua
            DataField = 'DESTINO'
            DataSource = DMSincronizacionSkrit.DSxCabecera
            TabOrder = 13
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1029
          Height = 215
          DataSource = DMSincronizacionSkrit.DSxCabecera
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'SERIE'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODE'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAYMENT'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DN_DATE'
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
              FieldName = 'NIF'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ADDRESS'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COUNTRY'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVINCE'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVINCEDESCRIPTION'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CITY'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CITYDESCRIPTION'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CP'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PHONE'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WAREHOUSE'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGISTRATION'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEREDBY'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDERNUMBER'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GROSSTOTAL'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHIPPING'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAX'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RATES'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRONTOPAGO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECARGOFINANCIERO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BASEIMPONIBLE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTAJEIVA'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROMPTPAYMENT'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DISCOUNT'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVATIONS'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INVOICED'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_E'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESTINO'
              Width = 100
              Visible = True
            end>
        end
        inherited BMaximizarTabla: TButton
          Left = 478
          Top = 206
        end
      end
    end
    object PNLFiltro: TLFPanel
      Left = 2
      Top = 28
      Width = 1037
      Height = 23
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object PNLFiltroFechas: TLFPanel
        Left = 0
        Top = 0
        Width = 313
        Height = 23
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LFiltroFechas: TLFLabel
          Left = -1
          Top = 4
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fechas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DEDesde: TLFDateEdit
          Left = 45
          Top = 0
          Width = 90
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          OnChange = DEFechaChange
        end
        object DEHasta: TLFDateEdit
          Left = 135
          Top = 0
          Width = 90
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          OnChange = DEFechaChange
        end
        object BFechaAnterior: TButton
          Left = 224
          Top = 0
          Width = 19
          Height = 22
          Hint = 'Mes Anterior'
          Caption = '<'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BFechaAnteriorClick
        end
        object BFechaSiguiente: TButton
          Left = 284
          Top = 0
          Width = 19
          Height = 22
          Hint = 'Mes Siguiente'
          Caption = '>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = BFechaSiguienteClick
        end
        object BFechaDia: TButton
          Left = 244
          Top = 0
          Width = 19
          Height = 22
          Hint = 'Dia'
          Caption = 'D'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = BFechaDiaClick
        end
        object BFechaMes: TButton
          Left = 264
          Top = 0
          Width = 19
          Height = 22
          Hint = 'Mes'
          Caption = 'M'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = BFechaMesClick
        end
      end
      object PNLFiltroTratado: TLFPanel
        Left = 313
        Top = 0
        Width = 141
        Height = 23
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object CBSoloNoSincronizados: TLFCheckBox
          Left = 4
          Top = 2
          Width = 133
          Height = 17
          Caption = 'Solo No Sincronizados'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          OnChange = DEFechaChange
        end
      end
      object PNLConfiguracion: TLFPanel
        Left = 454
        Top = 0
        Width = 583
        Height = 23
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object LProveedor: TLFLabel
          Left = 6
          Top = 4
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEProveedor: TLFDbedit
          Left = 146
          Top = 0
          Width = 263
          Height = 21
          Color = clInfoBk
          DataField = 'NOMBRE_R_SOCIAL'
          DataSource = DMSincronizacionSkrit.DSQMConfiguracion
          ReadOnly = True
          TabOrder = 0
        end
        object NavConfiguracion: THYMNavigator
          Left = 72
          Top = 0
          Width = 64
          Height = 22
          DataSource = DMSincronizacionSkrit.DSQMConfiguracion
          VisibleButtons = [nbPrior, nbNext]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          Exclusivo = True
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 321
    Width = 1041
    Height = 87
    inherited TBDetalle: TLFToolBar
      Width = 1041
      inherited NavDetalle: THYMNavigator
        DataSource = DMSincronizacionSkrit.DSxDetalle
        Hints.Strings = ()
      end
      object TBSep2: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBCreaArticulo: TToolButton
        Left = 228
        Top = 0
        Action = ACreaArticulo
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 1041
      Height = 65
      DataSource = DMSincronizacionSkrit.DSxDetalle
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINE'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCE'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EAN'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNITS'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRICE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTO1'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTO2'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTO3'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTOTOTAL'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NETLINE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_DETALLES_E'
          Width = 60
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 1041
  end
  object PNLInformacionSincronizacion: TLFPanel [3]
    Left = 0
    Top = 0
    Width = 1041
    Height = 25
    Align = alTop
    Caption = 'Sincronizacion con reparacion:'
    TabOrder = 3
    Visible = False
  end
  inherited CEMain: TControlEdit
    Left = 568
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 600
    Top = 0
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 696
    Top = 0
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ASincronizar: TAction
      Category = 'Procesos'
      Caption = 'Sincronizar'
      Hint = 'Leer albaranes de proveedor SKRIT'
      ImageIndex = 98
      OnExecute = ASincronizarExecute
    end
    object ACrearALP: TAction
      Category = 'Procesos'
      Caption = 'Crear Albaran de Comrpa'
      Hint = 'Crear Albaran de Comrpa'
      ImageIndex = 60
      OnExecute = ACrearALPExecute
    end
    object ACreaArticulo: TAction
      Category = 'Procesos'
      Caption = 'Crea Articulo'
      Hint = 'Crea Articulo'
      ImageIndex = 109
      OnExecute = ACreaArticuloExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBSoloNoSincronizados.Checked')
    Left = 728
    Top = 0
  end
  inherited CEDetalle: TControlEdit
    Left = 632
    Top = 0
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 664
    Top = 0
  end
end
