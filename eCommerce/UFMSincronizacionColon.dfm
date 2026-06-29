inherited FMSincronizacionColon: TFMSincronizacionColon
  Width = 779
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Sincronizacion Colon'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Top = 25
    Width = 769
    Height = 281
    object LProgreso: TLFLabel [0]
      Left = 2
      Top = 44
      Width = 765
      Height = 13
      Align = alTop
      Caption = 'Progreso'
      Visible = False
    end
    inherited TBMain: TLFToolBar
      Width = 765
      inherited NavMain: THYMNavigator
        DataSource = DMSincronizacionColon.DSxCabecera
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
      object PNLFiltroFechas: TLFPanel
        Left = 350
        Top = 0
        Width = 303
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LFiltroFechas: TLFLabel
          Left = 6
          Top = 4
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fechas'
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
          TabOrder = 4
          OnClick = BFechaMesClick
        end
      end
      object PNLFiltroTratado: TLFPanel
        Left = 653
        Top = 0
        Width = 143
        Height = 22
        TabOrder = 3
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
    end
    inherited PCMain: TLFPageControl
      Top = 57
      Width = 765
      Height = 222
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
          Width = 757
          Height = 194
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMSincronizacionColon.DSxCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'IMP_ALP_COLON_CAB'
            CampoNum = 'NRO_DOCUMENTO'
            CampoStr = 'FECHA'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'NRO_DOCUMENTO')
          end
          object LCIFProveedpr: TLFLabel
            Left = 32
            Top = 3
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'CIF Prov.'
          end
          object LNroDocumento: TLFLabel
            Left = 1
            Top = 25
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro Documento'
          end
          object LFecha: TLFLabel
            Left = 46
            Top = 47
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LCodigoCliente: TLFLabel
            Left = 8
            Top = 69
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo Cliente'
          end
          object LCIFCliente: TLFLabel
            Left = 25
            Top = 91
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'CIF Cliente'
          end
          object LNroEnvio: TLFLabel
            Left = 26
            Top = 113
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Envio'
          end
          object LSuReferencia: TLFLabel
            Left = 8
            Top = 135
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Su Referencia'
          end
          object LDireccionEnvio: TLFLabel
            Left = 1
            Top = 157
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion Envio'
          end
          object LTotal: TLFLabel
            Left = 549
            Top = 113
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total'
            Visible = False
          end
          object LBaseImponible: TLFLabel
            Left = 501
            Top = 25
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Imponible'
            Visible = False
          end
          object LIVA: TLFLabel
            Left = 556
            Top = 69
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'IVA'
            Visible = False
          end
          object LCuotaIVA: TLFLabel
            Left = 556
            Top = 91
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'IVA'
            Visible = False
          end
          object LImpuesto: TLFLabel
            Left = 530
            Top = 47
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Impuesto'
            Visible = False
          end
          object LDestino: TLFLabel
            Left = 454
            Top = 3
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Doc. Destino'
          end
          object LAgenciaTransporte: TLFLabel
            Left = 6
            Top = 179
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ag. Transporte'
          end
          object LPortes: TLFLabel
            Left = 46
            Top = 201
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Portes'
          end
          object DBECIFProveedor: TLFDbedit
            Left = 80
            Top = 0
            Width = 121
            Height = 21
            DataField = 'CIF_PROVEEDOR'
            DataSource = DMSincronizacionColon.DSxCabecera
            TabOrder = 0
          end
          object DBENroDocumento: TLFDbedit
            Left = 80
            Top = 22
            Width = 121
            Height = 21
            DataField = 'NRO_DOCUMENTO'
            DataSource = DMSincronizacionColon.DSxCabecera
            TabOrder = 1
          end
          object DBDEFecha: TLFDBDateEdit
            Left = 80
            Top = 44
            Width = 121
            Height = 21
            DataField = 'FECHA'
            DataSource = DMSincronizacionColon.DSxCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBECodigoCliente: TLFDbedit
            Left = 80
            Top = 66
            Width = 121
            Height = 21
            DataField = 'CODIGO_CLIENTE'
            DataSource = DMSincronizacionColon.DSxCabecera
            TabOrder = 3
          end
          object DBECIFCliente: TLFDbedit
            Left = 80
            Top = 88
            Width = 121
            Height = 21
            DataField = 'CIF_CLIENTE'
            DataSource = DMSincronizacionColon.DSxCabecera
            TabOrder = 4
          end
          object DBENroEnvio: TLFDbedit
            Left = 80
            Top = 110
            Width = 121
            Height = 21
            DataField = 'NRO_ENVIO'
            DataSource = DMSincronizacionColon.DSxCabecera
            TabOrder = 5
          end
          object DBESuReferencia: TLFDbedit
            Left = 80
            Top = 132
            Width = 121
            Height = 21
            DataField = 'SU_REFERENCIA'
            DataSource = DMSincronizacionColon.DSxCabecera
            TabOrder = 6
          end
          object DBEDireccionEnvio: TLFDbedit
            Left = 80
            Top = 154
            Width = 585
            Height = 21
            DataField = 'DIRECCION_ENVIO'
            DataSource = DMSincronizacionColon.DSxCabecera
            TabOrder = 7
          end
          object DBETotal: TLFDbedit
            Left = 577
            Top = 110
            Width = 88
            Height = 21
            Color = clMoneyGreen
            TabOrder = 12
            Visible = False
          end
          object DBEBaseImponible: TLFDbedit
            Left = 577
            Top = 22
            Width = 88
            Height = 21
            Color = clMoneyGreen
            TabOrder = 8
            Visible = False
          end
          object DBEIVA: TLFDbedit
            Left = 577
            Top = 66
            Width = 88
            Height = 21
            Color = clMoneyGreen
            TabOrder = 10
            Visible = False
          end
          object DBECuotaIVA: TLFDbedit
            Left = 577
            Top = 88
            Width = 88
            Height = 21
            Color = clMoneyGreen
            TabOrder = 11
            Visible = False
          end
          object DBEImpuesto: TLFDbedit
            Left = 577
            Top = 44
            Width = 88
            Height = 21
            Color = clMoneyGreen
            TabOrder = 9
            Visible = False
          end
          object DBEDestino: TLFDbedit
            Left = 520
            Top = 0
            Width = 145
            Height = 21
            Color = clAqua
            DataField = 'DESTINO'
            DataSource = DMSincronizacionColon.DSxCabecera
            TabOrder = 13
          end
          object DBEAgenciaTransporte: TLFDbedit
            Left = 80
            Top = 176
            Width = 121
            Height = 21
            DataField = 'AGENCIA_TRANSPORTE'
            DataSource = DMSincronizacionColon.DSxCabecera
            TabOrder = 14
          end
          object DBEPortes: TLFDbedit
            Left = 80
            Top = 198
            Width = 121
            Height = 21
            DataField = 'DEBIDOS_PAGADOS'
            DataSource = DMSincronizacionColon.DSxCabecera
            TabOrder = 15
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 757
          Height = 223
          DataSource = DMSincronizacionColon.DSxCabecera
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'CIF_PROVEEDOR'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRO_DOCUMENTO'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CARGO_ABONO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_CLIENTE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIF_CLIENTE'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRO_ENVIO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIRECCION_ENVIO'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGENCIA_TRANSPORTE'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEBIDOS_PAGADOS'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESTINO'
              Width = 120
              Visible = True
            end>
        end
        inherited BMaximizarTabla: TButton
          Left = 342
          Top = 214
        end
      end
    end
    object PBProgreso: TProgressBar
      Left = 2
      Top = 28
      Width = 765
      Height = 16
      Align = alTop
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 2
      Visible = False
    end
  end
  inherited PDetalle: TLFPanel
    Top = 306
    Width = 769
    Height = 102
    inherited TBDetalle: TLFToolBar
      Width = 769
      inherited NavDetalle: THYMNavigator
        DataSource = DMSincronizacionColon.DSxDetalle
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
      Width = 769
      Height = 80
      DataSource = DMSincronizacionColon.DSxDetalle
      PopupMenu = nil
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'LINEA'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_BARRAS'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REF_CATALOGO'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_UNITARIO'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE_TOTAL'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 120
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 769
  end
  object PNLInformacionSincronizacion: TLFPanel [3]
    Left = 0
    Top = 0
    Width = 769
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
      Hint = 'Leer albaranes de proveedor Colon'
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
