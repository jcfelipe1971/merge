inherited FMAlbaranesAlquiler: TFMAlbaranesAlquiler
  Caption = 'Albaranes Alquiler'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
      inherited PNLTitSerie: TLFPanel
        inherited LBLSerie: TLFLabel
          Left = 11
        end
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        object SBMovimientoDevolucion: TSpeedButton [2]
          Left = 112
          Top = 91
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBMovimientoDevolucionDblClick
        end
        object SBFacturaRoturas: TSpeedButton [3]
          Left = 120
          Top = 99
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBFacturaRoturasDblClick
        end
        object SBFacturaAlquiler: TSpeedButton [4]
          Left = 112
          Top = 91
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBFacturaAlquilerDblClick
        end
        inherited PNLEdCabecera: TLFPanel
          inherited EFAlmacen: TLFDBEditFind2000
            TabOrder = 18
          end
          object PNLDocumentosRelacionados: TLFPanel [67]
            Left = 0
            Top = 199
            Width = 1164
            Height = 21
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 15
            object LMovimientoDevolucion: TLFLabel
              Left = 19
              Top = 3
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Devolucion'
            end
            object LFacturaAlquiler: TLFLabel
              Left = 155
              Top = 3
              Width = 57
              Height = 13
              Alignment = taRightJustify
              Caption = 'Factura Alq.'
            end
            object LFacturaRoturas: TLFLabel
              Left = 774
              Top = 3
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fact. Roturas'
            end
            object LSerieRoturas: TLFLabel
              Left = 430
              Top = 3
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie'
              Layout = tlCenter
            end
            object DBEMovimientoDevolucion: TLFDbedit
              Left = 78
              Top = 0
              Width = 63
              Height = 21
              Color = clAqua
              DataField = 'MOV_DEVOLUCION'
              DataSource = DMAlbaranesAlquiler.DSxInfoActualizada
              TabOrder = 0
            end
            object DBEFacturaAlquiler: TLFDbedit
              Left = 214
              Top = 0
              Width = 63
              Height = 21
              Color = clAqua
              DataField = 'FAC_ALQUILER'
              DataSource = DMAlbaranesAlquiler.DSxInfoActualizada
              TabOrder = 1
            end
            object DBEFacturaRoturas: TLFDbedit
              Left = 842
              Top = 0
              Width = 63
              Height = 21
              Color = clAqua
              DataField = 'FAC_ROTURAS'
              DataSource = DMAlbaranesAlquiler.DSxInfoActualizada
              TabOrder = 2
            end
            object ESerieRoturas: TLFEdit
              Left = 524
              Top = 0
              Width = 239
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEFSerieRoturas: TLFDBEditFind2000
              Left = 458
              Top = 0
              Width = 64
              Height = 21
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'SERIE_ROTURAS'
              DataSource = DMAlbaranesAlquiler.DSQMCabecera
              TabOrder = 4
              OnChange = DBEFSerieRoturasChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_CANALES_SERIES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'SERIE'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'SERIE')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMAlbaranes.EntornoDoc
            end
          end
          inherited DBEObservaciones: TLFDbedit
            TabOrder = 47
          end
        end
      end
      inherited TSOtros: TTabSheet
        inherited PNLCabOtros: TLFPanel
          inherited NavOtros: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
      inherited TSNotas: TTabSheet
        inherited PNLCabNotas: TLFPanel
          inherited NavNotas: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
      inherited TSCartaPorte: TTabSheet
        inherited TBCartaPorte: TLFToolBar
          inherited NavCartaPortes: THYMNavigator
            Hints.Strings = ()
          end
        end
        inherited PNLCartaPorte: TLFPanel
          inherited PNLMatNat: TLFPanel
            inherited PNLMatricula: TLFPanel
              inherited TBMat: TLFToolBar
                inherited NavMat: THYMNavigator
                  Hints.Strings = ()
                end
              end
            end
            inherited PNLNaturaleza: TLFPanel
              inherited TBNat: TLFToolBar
                inherited NavNat: THYMNavigator
                  Hints.Strings = ()
                end
              end
            end
          end
        end
      end
      inherited TSDirManual: TTabSheet
        inherited PNLDirManual: TLFPanel
          inherited NavDirEntrega: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
      inherited TSOtrosChile: TTabSheet
        inherited PEdOtrosChile: TLFPanel
          inherited GBReferencia: TGroupBox
            inherited PNLReferenciasDteCab: TLFPanel
              inherited NavReferenciasDte: THYMNavigator
                Hints.Strings = ()
              end
            end
          end
        end
        inherited PNLDteCab: TLFPanel
          inherited NavOtrosChile: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
      inherited TSProveedores: TTabSheet
        inherited PNLProveedores: TLFPanel
          inherited NavProveedores: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    inherited TBDetalle: TLFToolBar
      inherited NavDetalle: THYMNavigator
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      DataSource = DMAlbaranesAlquiler.DSQMDetalle
      PopupMenu = nil
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ORDEN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 32
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_RELACION'
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 335
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Title.Alignment = taRightJustify
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_ROTAS'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TIPO_UNIDAD_LOGISTICA'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TITULO_UNIDAD_LOGISTICA'
          Title.Alignment = taRightJustify
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_LOGISTICAS'
          Title.Alignment = taRightJustify
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_SEC'
          Title.Alignment = taRightJustify
          Width = 47
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_EXT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Title.Alignment = taRightJustify
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COSTE_ADICIONAL'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_LINEA_KRI'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_IVA'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_2'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_3'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NO_FABRICACION_KRI'
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'B_IMPONIBLE'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'I_DESCUENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 88
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'BRUTO'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PIEZAS_X_BULTO'
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'BULTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'B_COMISION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMISION'
          Title.Alignment = taRightJustify
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'I_COMISION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 90
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_COSTE'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'T_COSTE'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'M_BRUTO'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COMISION_LINEAL'
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'I_COMISION_LINEAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_IVA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 42
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_RECARGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 42
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'B_DTO_LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_SERVIDA'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGrayText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_FACTURADAS'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGrayText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAJA_EDI'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_CAJA_EDI'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_REC_DET'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROYECTO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_LOTE'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LOTE'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_UBICACION'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COMPOSICION'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CALLE'
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ESTANTERIA'
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'REPISA'
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'POSICION'
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIRECCION_ENTREGA'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_CLIENTE'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_CLIENTE'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INVERSION_SUJETO_PASIVO'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_IMPUESTO_ADICIONAL'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_IMPUESTO_ADICIONAL'
          ReadOnly = True
          Visible = True
        end>
    end
  end
end
