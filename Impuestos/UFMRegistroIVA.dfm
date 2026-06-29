inherited FMRegistroIVA: TFMRegistroIVA
  Left = 205
  Top = 216
  Width = 1479
  Height = 725
  HelpContext = 256
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Registro de I.V.A.'
  PopupMenu = CEDetallePMEdit
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1469
    Height = 672
    inherited TBMain: TLFToolBar
      Width = 1465
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = DMRegistroIVA.DSQMRegistroIVA
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBEDocSerie
        InsertaControl = DBEDocSerie
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited EPMain: THYMEditPanel
        Left = 118
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 178
      end
      inherited TbuttComp: TToolButton
        Left = 186
      end
      object TButtSep2: TToolButton
        Left = 209
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBtPermutarTipo: TToolButton
        Left = 217
        Top = 0
        Hint = 'Permutar Tipo de IVA'
        Caption = 'PermutarTipoIVA'
        ImageIndex = 118
        OnClick = TBtPermutarTipoClick
      end
      object PNLTipoIVA: TLFPanel
        Left = 240
        Top = 0
        Width = 87
        Height = 22
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        object ESigno: TLFEdit
          Left = 0
          Top = 0
          Width = 83
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
          TabOrder = 0
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1465
      Height = 642
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        object SBVerFactura: TSpeedButton [0]
          Left = 288
          Top = 43
          Width = 153
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+F para ver la factura asociada'
          GroupIndex = -1
          OnDblClick = SBVerFacturaDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1457
          Height = 143
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'NUM_FACTURA'
              'RIG_VISIBLE')
            DataSource = DMRegistroIVA.DSQMRegistroIVA
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_EMP_REGISTRO_IVA'
            CampoNum = 'REGISTRO'
            CampoStr = 'NOMBRE'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'REGISTRO')
          end
          object LLiquido: TLFLabel
            Left = 536
            Top = 102
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'L'#237'quido'
          end
          object LBaseImponible: TLFLabel
            Left = 32
            Top = 102
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bases'
          end
          object LImporteIVA: TLFLabel
            Left = 212
            Top = 102
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'I.V.A.'
          end
          object LImporteRecargo: TLFLabel
            Left = 369
            Top = 102
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recargo'
          end
          object LSImpuestoAdicional: TLFLabel
            Left = 698
            Top = 102
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp. Adicional'
          end
          object LRetencion: TLFLabel
            Left = 891
            Top = 102
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Retencion'
          end
          object DBRGTipo: TDBRadioGroup
            Left = 8
            Top = 4
            Width = 105
            Height = 64
            Caption = 'Tipo'
            DataField = 'SIGNO'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
            Items.Strings = (
              'Repercutido'
              'Soportado')
            TabOrder = 0
            Values.Strings = (
              'R'
              'S')
          end
          object GBRegistro: TGroupBox
            Left = 117
            Top = 4
            Width = 153
            Height = 64
            Caption = 'Registro'
            Enabled = False
            TabOrder = 1
            object LNumero: TLFLabel
              Left = 20
              Top = 17
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#250'mero'
            end
            object LFecha: TLFLabel
              Left = 27
              Top = 38
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object DBERegistro: TLFDbedit
              Left = 62
              Top = 13
              Width = 68
              Height = 21
              Color = clInfoBk
              DataField = 'RIG_VISIBLE'
              DataSource = DMRegistroIVA.DSQMRegistroIVA
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEFechaRegistro: TLFDbedit
              Left = 62
              Top = 35
              Width = 68
              Height = 21
              Color = clInfoBk
              DataField = 'FECHA_REGISTRO'
              DataSource = DMRegistroIVA.DSQMRegistroIVA
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GBDoc: TGroupBox
            Left = 274
            Top = 4
            Width = 458
            Height = 64
            Caption = 'Documento'
            TabOrder = 2
            object LNumeroDocumento: TLFLabel
              Left = 178
              Top = 16
              Width = 25
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#250'm.'
            end
            object LSerie: TLFLabel
              Left = 45
              Top = 16
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie'
            end
            object LFechaDocumento: TLFLabel
              Left = 266
              Top = 16
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object LModoIVA: TLFLabel
              Left = 176
              Top = 38
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Modo'
            end
            object DBEDocNum: TLFDbedit
              Left = 208
              Top = 12
              Width = 49
              Height = 21
              Color = clInfoBk
              DataField = 'DOC_NUMERO'
              DataSource = DMRegistroIVA.DSQMRegistroIVA
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEDocSerie: TLFDbedit
              Left = 74
              Top = 12
              Width = 83
              Height = 21
              CharCase = ecUpperCase
              Color = clInfoBk
              DataField = 'DOC_SERIE'
              DataSource = DMRegistroIVA.DSQMRegistroIVA
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object ETitModo: TLFEdit
              Left = 245
              Top = 34
              Width = 190
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
              TabOrder = 6
            end
            object DBCBContabilizado: TLFDBCheckBox
              Left = 377
              Top = 15
              Width = 59
              Height = 17
              Caption = 'Contab.'
              ClicksDisabled = False
              ColorCheck = 57088
              Enabled = False
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object DBEDocTipo: TLFDbedit
              Left = 6
              Top = 34
              Width = 151
              Height = 21
              Color = clAqua
              DataField = 'DOC_TIPO_TITULO'
              DataSource = DMRegistroIVA.DSQMRegistroIVA
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
            object DBEDocFecha: TLFDbedit
              Left = 300
              Top = 12
              Width = 68
              Height = 21
              Color = clInfoBk
              DataField = 'DOC_FECHA'
              DataSource = DMRegistroIVA.DSQMRegistroIVA
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEModoIva: TLFDbedit
              Left = 208
              Top = 34
              Width = 36
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'MODO'
              DataSource = DMRegistroIVA.DSQMRegistroIVA
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
              OnChange = DBEModoIvaChange
            end
          end
          object DBEDescripcion_Cta: TLFDbedit
            Left = 176
            Top = 76
            Width = 348
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'DESCRIPCION_CTA'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBECif: TLFDbedit
            Left = 525
            Top = 76
            Width = 161
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'NIF'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object DBELiquido: TLFDbedit
            Left = 576
            Top = 98
            Width = 110
            Height = 21
            Color = clInfoBk
            DataField = 'LIQUIDO'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBE_S_Bases: TLFDbedit
            Left = 65
            Top = 98
            Width = 110
            Height = 21
            Color = clInfoBk
            DataField = 'S_BASES'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBE_S_Ivas: TLFDbedit
            Left = 243
            Top = 98
            Width = 110
            Height = 21
            Color = clInfoBk
            DataField = 'S_IVAS'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBE_S_Recargos: TLFDbedit
            Left = 414
            Top = 98
            Width = 110
            Height = 21
            Color = clInfoBk
            DataField = 'S_RECARGOS'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBECuenta: TLFDbedit
            Left = 35
            Top = 76
            Width = 140
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CUENTA'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
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
          object DBCBRECC: TLFDBCheckBox
            Left = 35
            Top = 121
            Width = 206
            Height = 17
            Caption = 'Reg. Esp. Criterio de Caja'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCBRECCChange
            DataField = 'RECC'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBESImpuestoAdicional: TLFDbedit
            Left = 768
            Top = 98
            Width = 110
            Height = 21
            Color = clInfoBk
            DataField = 'S_IMPUESTO_ADICIONAL'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object DBCBAnulado: TLFDBCheckBox
            Left = 752
            Top = 16
            Width = 121
            Height = 17
            Caption = 'Anulado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCBAnuladoChange
            DataField = 'ANULADO'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBERetencion: TLFDbedit
            Left = 944
            Top = 98
            Width = 110
            Height = 21
            Color = clInfoBk
            DataField = 'RETENCION'
            DataSource = DMRegistroIVA.DSQMRegistroIVA
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
        end
        object PDetalle: TLFPanel
          Left = 0
          Top = 143
          Width = 1457
          Height = 471
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBCGDetalle: TLFDBCtrlGrid
            Left = 0
            Top = 21
            Width = 1457
            Height = 379
            Align = alClient
            AllowDelete = False
            AllowInsert = False
            ColCount = 1
            DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
            PanelHeight = 75
            PanelWidth = 1441
            TabOrder = 0
            RowCount = 5
            object EFIva: TLFDBEditFind2000
              Left = 6
              Top = 2
              Width = 50
              Height = 21
              Color = clInfoBk
              DataField = 'TIPO_IVA'
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_IVA_PAIS                   '
              Tabla_asociada.DesplegarBusqueda = False
              Campos_Desplegar.Strings = (
                'P_IVA'
                'P_RECARGO')
              CampoNum = 'TIPO'
              CampoStr = 'T_TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              Filtros = [obPais]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEDescTipo: TLFDbedit
              Left = 57
              Top = 2
              Width = 171
              Height = 21
              Color = clInfoBk
              DataField = 'Desc_Tipo'
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEBase: TLFDbedit
              Left = 339
              Top = 2
              Width = 118
              Height = 21
              Color = clInfoBk
              DataField = 'B_IMPONIBLE'
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEImpIva: TLFDbedit
              Left = 458
              Top = 2
              Width = 125
              Height = 21
              Color = clInfoBk
              DataField = 'I_IVA'
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
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
            object DBEImpRec: TLFDbedit
              Left = 584
              Top = 2
              Width = 125
              Height = 21
              Color = clInfoBk
              DataField = 'I_REC'
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
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
            object DBEPiva: TLFDbedit
              Left = 229
              Top = 2
              Width = 54
              Height = 21
              Color = clInfoBk
              DataField = 'P_IVA'
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object DBEPRecargo: TLFDbedit
              Left = 284
              Top = 2
              Width = 54
              Height = 21
              Color = clInfoBk
              DataField = 'P_REC'
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object CKInversionSujetoPasivo: TLFDBCheckBox
              Left = 999
              Top = 4
              Width = 186
              Height = 17
              Caption = 'Inversi'#243'n del Sujeto Pasivo'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 7
              TabStop = True
              Alignment = taLeftJustify
              OnChange = DBCBRECCChange
              DataField = 'INVERSION_SUJETO_PASIVO'
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBETipoImpuestoAdicional: TLFDbedit
              Left = 710
              Top = 2
              Width = 171
              Height = 21
              Color = clInfoBk
              DataField = 'TIPO_IMPUESTO_ADICIONAL'
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
            end
            object DBEPorcTipoImpuestoAdicional: TLFDbedit
              Left = 882
              Top = 2
              Width = 54
              Height = 21
              Color = clInfoBk
              DataField = 'P_IMPUESTO_ADICIONAL'
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
            end
            object DBELImpuestoAdicional: TLFDbedit
              Left = 937
              Top = 2
              Width = 54
              Height = 21
              Color = clInfoBk
              DataField = 'I_IMPUESTO_ADICIONAL'
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 10
            end
          end
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 1457
            Height = 21
            AutoSize = True
            ButtonHeight = 21
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 1
            Separators = True
            object NavDetalle: THYMNavigator
              Left = 0
              Top = 0
              Width = 88
              Height = 21
              DataSource = DMRegistroIVA.DSQMRegistroIVADetalle
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Flat = True
              ParentShowHint = False
              PopupMenu = CEDetallePMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBEBase
              Exclusivo = True
              ControlEdit = CEDetalle
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object TButtSep1: TToolButton
              Left = 88
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object LTipoIVA: TLFLabel
              Left = 96
              Top = 0
              Width = 132
              Height = 21
              Cursor = crUpArrow
              Alignment = taCenter
              AutoSize = False
              Caption = 'Tipo de IVA'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object LPorcentajeIVA: TLFLabel
              Left = 228
              Top = 0
              Width = 55
              Height = 21
              Cursor = crUpArrow
              Alignment = taCenter
              AutoSize = False
              Caption = '% IVA'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object LPorcentajeRecargo: TLFLabel
              Left = 283
              Top = 0
              Width = 55
              Height = 21
              Cursor = crUpArrow
              Alignment = taCenter
              AutoSize = False
              Caption = '% Rec.'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object LImporteBase: TLFLabel
              Left = 338
              Top = 0
              Width = 118
              Height = 21
              Cursor = crUpArrow
              Alignment = taCenter
              AutoSize = False
              Caption = 'Base'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object LCuotaIVA: TLFLabel
              Left = 456
              Top = 0
              Width = 127
              Height = 21
              Cursor = crUpArrow
              Alignment = taCenter
              AutoSize = False
              Caption = 'Cuota IVA'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object LCuotaRecargo: TLFLabel
              Left = 583
              Top = 0
              Width = 125
              Height = 21
              Cursor = crUpArrow
              Alignment = taCenter
              AutoSize = False
              Caption = 'Cuota Recargo'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object LTipoImpuestoAdicional: TLFLabel
              Left = 708
              Top = 0
              Width = 171
              Height = 21
              Cursor = crUpArrow
              Alignment = taCenter
              AutoSize = False
              Caption = 'Tipo Impuesto Adicional'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object LPorcImpuestoAdicional: TLFLabel
              Left = 879
              Top = 0
              Width = 55
              Height = 21
              Cursor = crUpArrow
              Alignment = taCenter
              AutoSize = False
              Caption = '% Adic.'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object LImpuestoAdicional: TLFLabel
              Left = 934
              Top = 0
              Width = 55
              Height = 21
              Cursor = crUpArrow
              Alignment = taCenter
              AutoSize = False
              Caption = 'Imp. Adic'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
          end
          object DBGRECC: THYTDBGrid
            Left = 0
            Top = 400
            Width = 1457
            Height = 71
            Align = alBottom
            Color = clInfoBk
            DataSource = DMRegistroIVA.DSQMRegistroIVADetalleRECC
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGRECCDblClick
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'FECHA_PRESENTACION'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'B_IMPONIBLE'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'I_IVA'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'I_REC'
                Width = 90
                Visible = True
              end
              item
                Color = clAqua
                Expanded = False
                FieldName = 'REGISTRO_CARTERA'
                Width = 112
                Visible = True
              end>
          end
        end
      end
      object TSSII: TTabSheet [1]
        Caption = 'SII'
        ImageIndex = 1
        OnShow = TSSIIShow
        object PNLSIIEmitidas: TLFPanel
          Left = 0
          Top = 0
          Width = 1209
          Height = 363
          BevelOuter = bvNone
          TabOrder = 0
          object TBSIIEmitidas: TLFToolBar
            Left = 0
            Top = 0
            Width = 1209
            Height = 22
            AutoSize = True
            EdgeBorders = []
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavSIIEmitidas: THYMNavigator
              Left = 0
              Top = 0
              Width = 220
              Height = 22
              DataSource = DMRegistroIVA.DSRLRFacEmi
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
            object Butt1: TToolButton
              Left = 220
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object ButtGenerarModificacionEmitida: TToolButton
              Left = 228
              Top = 0
              Hint = 'Generar Registro de Modificacion'
              Caption = 'Generar Registro de Modificacion'
              ImageIndex = 8
              OnClick = ButtGenerarModificacionEmitidaClick
            end
            object ButtGenerarBajaEmitida: TToolButton
              Left = 251
              Top = 0
              Hint = 'Generar Registro de Baja'
              Caption = 'Generar Registro de Baja'
              ImageIndex = 6
              OnClick = ButtGenerarBajaEmitidaClick
            end
            object Butt3: TToolButton
              Left = 274
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtRegenerarSIIEmitidas: TToolButton
              Left = 282
              Top = 0
              Hint = 'Regenerar Registro SII'
              Caption = 'Regenerar Registro SII'
              ImageIndex = 7
              OnClick = TButtRegenerarSIIEmitidasClick
            end
            object TSep1: TToolButton
              Left = 305
              Top = 0
              Width = 8
              ImageIndex = 8
              Style = tbsSeparator
            end
            object TBDesvincularSIIEmitidas: TToolButton
              Left = 313
              Top = 0
              Hint = 'Desvincular SII del registro deIVA'
              Caption = 'Desvincular SII del registro deIVA'
              ImageIndex = 69
              OnClick = TBDesvincularSIIEmitidasClick
            end
            object TBTSep3: TToolButton
              Left = 336
              Top = 0
              Width = 8
              ImageIndex = 129
              Style = tbsSeparator
            end
            object TBSIIModificaTipoDesgloseSIIEmitidas: TToolButton
              Left = 344
              Top = 0
              Hint = 'Modifica Tipo de Desglose'
              Caption = 'Modifica Tipo de Desglose'
              ImageIndex = 18
              OnClick = TBSIIModificaTipoDesgloseSIIEmitidasClick
            end
          end
          object PNLRegistroFacturasEmitidasDatos: TLFPanel
            Left = 0
            Top = 22
            Width = 1209
            Height = 203
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object LFLabel9: TLFLabel
              Left = 52
              Top = 139
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Fac.'
            end
            object LFLabel1: TLFLabel
              Left = 88
              Top = 7
              Width = 9
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id'
            end
            object LFLabel10: TLFLabel
              Left = 230
              Top = 7
              Width = 107
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Agr. N. Serie F. Emi.'
            end
            object LFLabel11: TLFLabel
              Left = 249
              Top = 29
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Agr Fec. Exped.'
            end
            object LFLabel12: TLFLabel
              Left = 223
              Top = 73
              Width = 114
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Rect. N. Serie F. Emi.'
            end
            object LFLabel13: TLFLabel
              Left = 222
              Top = 95
              Width = 115
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Rect. Fec. Expedicon'
            end
            object LFLabel15: TLFLabel
              Left = 245
              Top = 139
              Width = 92
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imp. F. Rect. Cuota'
            end
            object LFLabel16: TLFLabel
              Left = 222
              Top = 161
              Width = 115
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imp. F. Rect.Cuota Rec.'
            end
            object LFLabel17: TLFLabel
              Left = 500
              Top = 7
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fec. Operacion'
            end
            object LFLabel18: TLFLabel
              Left = 496
              Top = 29
              Width = 77
              Height = 13
              Alignment = taRightJustify
              Caption = 'Clave Reg. Esp.'
            end
            object LFLabel19: TLFLabel
              Left = 487
              Top = 51
              Width = 86
              Height = 13
              Alignment = taRightJustify
              Caption = 'Clave Reg. Esp. 1'
            end
            object LFLabel2: TLFLabel
              Left = 47
              Top = 161
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Rect.'
            end
            object LFLabel20: TLFLabel
              Left = 487
              Top = 73
              Width = 86
              Height = 13
              Alignment = taRightJustify
              Caption = 'Clave Reg. Esp. 2'
            end
            object LFLabel21: TLFLabel
              Left = 455
              Top = 95
              Width = 118
              Height = 13
              Alignment = taRightJustify
              Caption = 'Num. Reg. Acuedro Fac.'
            end
            object LFLabel22: TLFLabel
              Left = 511
              Top = 117
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Importe Total'
            end
            object LFLabel23: TLFLabel
              Left = 486
              Top = 139
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Base Imp. A Coste'
            end
            object LFLabel24: TLFLabel
              Left = 517
              Top = 161
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'Descripcion'
            end
            object LFLabel25: TLFLabel
              Left = 721
              Top = 138
              Width = 90
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imnueble Situacion'
            end
            object LFLabel26: TLFLabel
              Left = 701
              Top = 160
              Width = 110
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imnueble Ref. Catastral'
            end
            object LFLabel27: TLFLabel
              Left = 943
              Top = 51
              Width = 106
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imp. Trans. Sujeta IVA'
            end
            object LFLabel28: TLFLabel
              Left = 951
              Top = 73
              Width = 98
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emitida Por Terceros'
            end
            object LFLabel29: TLFLabel
              Left = 956
              Top = 95
              Width = 93
              Height = 13
              Alignment = taRightJustify
              Caption = 'Varios Destinatarios'
            end
            object LFLabel3: TLFLabel
              Left = 247
              Top = 118
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imp. F. Rect. Base'
            end
            object LFLabel30: TLFLabel
              Left = 1018
              Top = 117
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cupon'
            end
            object LFLabel31: TLFLabel
              Left = 697
              Top = 7
              Width = 114
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. Nombre Razon'
            end
            object LFLabel32: TLFLabel
              Left = 751
              Top = 29
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. NIF'
            end
            object LFLabel33: TLFLabel
              Left = 722
              Top = 51
              Width = 89
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. NIF Repr.'
            end
            object LFLabel34: TLFLabel
              Left = 723
              Top = 73
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. Cod. Pais'
            end
            object LFLabel35: TLFLabel
              Left = 735
              Top = 95
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. IdType'
            end
            object LFLabel36: TLFLabel
              Left = 759
              Top = 117
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. Id'
            end
            object LFLabel37: TLFLabel
              Left = 981
              Top = 139
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Desglose'
            end
            object LFLabel38: TLFLabel
              Left = 943
              Top = 161
              Width = 106
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Desgl. Operacion'
            end
            object LFLabel4: TLFLabel
              Left = 12
              Top = 29
              Width = 85
              Height = 13
              Alignment = taRightJustify
              Caption = 'Per. Imp. Ejercicio'
            end
            object LFLabel5: TLFLabel
              Left = 16
              Top = 51
              Width = 81
              Height = 13
              Alignment = taRightJustify
              Caption = 'Per. Imp. Periodo'
            end
            object LFLabel6: TLFLabel
              Left = 46
              Top = 73
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emisor NIF'
            end
            object LFLabel7: TLFLabel
              Left = -13
              Top = 95
              Width = 110
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emisor Num. Serie Fac.'
            end
            object LFLabel8: TLFLabel
              Left = -30
              Top = 117
              Width = 127
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emisor Num. Serie Fac. Fin'
            end
            object LEstadoRegistroEmi: TLFLabel
              Left = 22
              Top = 182
              Width = 75
              Height = 13
              Alignment = taRightJustify
              Caption = 'Estado Registro'
            end
            object LIdPresentacionEmi: TLFLabel
              Left = 974
              Top = 30
              Width = 74
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id Presentacion'
            end
            object DBEFACEXP_BASEIMPONIBLEACOSTE: TLFDbedit
              Left = 577
              Top = 135
              Width = 110
              Height = 21
              DataField = 'FACEXP_BASEIMPONIBLEACOSTE'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 22
            end
            object DBEFACEXP_CLAVE_REG_ESP: TLFDbedit
              Left = 577
              Top = 25
              Width = 110
              Height = 21
              DataField = 'FACEXP_CLAVE_REG_ESP'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 17
            end
            object DBEFACEXP_CLAVE_REG_ESP1: TLFDbedit
              Left = 577
              Top = 47
              Width = 110
              Height = 21
              DataField = 'FACEXP_CLAVE_REG_ESP1'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 18
            end
            object DBEFACEXP_CLAVE_REG_ESP2: TLFDbedit
              Left = 577
              Top = 69
              Width = 110
              Height = 21
              DataField = 'FACEXP_CLAVE_REG_ESP2'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 19
            end
            object DBEFACEXP_CONTRAP_NIF: TLFDbedit
              Left = 815
              Top = 25
              Width = 110
              Height = 21
              DataField = 'FACEXP_CONTRAP_NIF'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 25
            end
            object DBEFACEXP_CONTRAP_NIF_REPRES: TLFDbedit
              Left = 815
              Top = 47
              Width = 110
              Height = 21
              DataField = 'FACEXP_CONTRAP_NIF_REPRES'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 26
            end
            object DBEFACEXP_CONTRAP_NOMBRE_RAZON: TLFDbedit
              Left = 815
              Top = 3
              Width = 348
              Height = 21
              DataField = 'FACEXP_CONTRAP_NOMBRE_RAZON'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 24
            end
            object DBEFACEXP_CONTRAPARTE_CODPAIS: TLFDbedit
              Left = 815
              Top = 69
              Width = 110
              Height = 21
              DataField = 'FACEXP_CONTRAPARTE_CODPAIS'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 27
            end
            object DBEFACEXP_CONTRAPARTE_ID: TLFDbedit
              Left = 815
              Top = 113
              Width = 110
              Height = 21
              DataField = 'FACEXP_CONTRAPARTE_ID'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 29
            end
            object DBEFACEXP_CONTRAPARTE_IDTYPE: TLFDbedit
              Left = 815
              Top = 91
              Width = 110
              Height = 21
              DataField = 'FACEXP_CONTRAPARTE_IDTYPE'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 28
            end
            object DBEFACEXP_CUPON: TLFDbedit
              Left = 1053
              Top = 113
              Width = 110
              Height = 21
              DataField = 'FACEXP_CUPON'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 35
            end
            object DBEFACEXP_DESCRIPCION: TLFDbedit
              Left = 577
              Top = 157
              Width = 110
              Height = 21
              DataField = 'FACEXP_DESCRIPCION'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 23
            end
            object DBEFACEXP_EMITIDA_POR_TERCEROS: TLFDbedit
              Left = 1053
              Top = 69
              Width = 110
              Height = 21
              DataField = 'FACEXP_EMITIDA_POR_TERCEROS'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 33
            end
            object DBEFACEXP_FAGR_FECHAEXPEDICION: TLFDbedit
              Left = 339
              Top = 25
              Width = 110
              Height = 21
              DataField = 'FACEXP_FAGR_FECHAEXPEDICION'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 10
            end
            object DBEFACEXP_FAGR_NUMSERIEFACEMISOR: TLFDbedit
              Left = 339
              Top = 3
              Width = 110
              Height = 21
              DataField = 'FACEXP_FAGR_NUMSERIEFACEMISOR'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 9
            end
            object DBEFACEXP_FECHAOPERACION: TLFDbedit
              Left = 577
              Top = 3
              Width = 110
              Height = 21
              DataField = 'FACEXP_FECHAOPERACION'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 16
            end
            object DBEFACEXP_FRECT_FECHAEXPEDICION: TLFDbedit
              Left = 339
              Top = 91
              Width = 110
              Height = 21
              DataField = 'FACEXP_FRECT_FECHAEXPEDICION'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 12
            end
            object DBEFACEXP_FRECT_NUMSERIEFACEMISOR: TLFDbedit
              Left = 339
              Top = 69
              Width = 110
              Height = 21
              DataField = 'FACEXP_FRECT_NUMSERIEFACEMISOR'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 11
            end
            object DBEFACEXP_IMPORTE_TOTAL: TLFDbedit
              Left = 577
              Top = 113
              Width = 110
              Height = 21
              DataField = 'FACEXP_IMPORTE_TOTAL'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 21
            end
            object DBEFACEXP_IMPORTETRANSMSUJETAIVA: TLFDbedit
              Left = 1053
              Top = 47
              Width = 110
              Height = 21
              DataField = 'FACEXP_IMPORTETRANSMSUJETAIVA'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 32
            end
            object DBEFACEXP_IMPRECT_BASERECT: TLFDbedit
              Left = 339
              Top = 113
              Width = 110
              Height = 21
              DataField = 'FACEXP_IMPRECT_BASERECT'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 13
            end
            object DBEFACEXP_IMPRECT_CUOTARECRECT: TLFDbedit
              Left = 339
              Top = 135
              Width = 110
              Height = 21
              DataField = 'FACEXP_IMPRECT_CUOTARECT'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 14
            end
            object DBEFACEXP_IMPRECT_CUOTARECT: TLFDbedit
              Left = 339
              Top = 157
              Width = 110
              Height = 21
              DataField = 'FACEXP_IMPRECT_CUOTARECRECT'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 15
            end
            object DBEFACEXP_INMUEBLE_REFCATASTRAL: TLFDbedit
              Left = 815
              Top = 157
              Width = 110
              Height = 21
              DataField = 'FACEXP_INMUEBLE_REFCATASTRAL'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 31
            end
            object DBEFACEXP_INMUEBLE_SITUACIONINM: TLFDbedit
              Left = 815
              Top = 135
              Width = 110
              Height = 21
              DataField = 'FACEXP_INMUEBLE_SITUACIONINM'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 30
            end
            object DBEFACEXP_NUMREGACUERDOFAC: TLFDbedit
              Left = 577
              Top = 91
              Width = 110
              Height = 21
              DataField = 'FACEXP_NUMREGACUERDOFAC'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 20
            end
            object DBEFACEXP_TIPOFACTURA: TLFDbedit
              Left = 101
              Top = 135
              Width = 110
              Height = 21
              DataField = 'FACEXP_TIPOFACTURA'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 6
            end
            object DBEFACEXP_TIPORECTIFICATIVA: TLFDbedit
              Left = 101
              Top = 157
              Width = 110
              Height = 21
              DataField = 'FACEXP_TIPORECTIFICATIVA'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 7
            end
            object DBEFACEXP_VARIOSDESTINATARIOS: TLFDbedit
              Left = 1053
              Top = 91
              Width = 110
              Height = 21
              DataField = 'FACEXP_VARIOSDESTINATARIOS'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 34
            end
            object DBEID_SII_REGLRFACTURASEMITIDAS: TLFDbedit
              Left = 101
              Top = 3
              Width = 110
              Height = 21
              DataField = 'ID_SII_REGLRFACTURASEMITIDAS'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 0
              OnChange = DBEID_SII_REGLRFACTURASEMITIDASChange
            end
            object DBEIDFAC_EMISOR_NIF: TLFDbedit
              Left = 101
              Top = 69
              Width = 110
              Height = 21
              DataField = 'IDFAC_EMISOR_NIF'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 3
            end
            object DBEIDFAC_EMISOR_NUMSERIEFAC: TLFDbedit
              Left = 101
              Top = 91
              Width = 110
              Height = 21
              DataField = 'IDFAC_EMISOR_NUMSERIEFAC'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 4
            end
            object DBEIDFAC_EMISOR_NUMSERIEFACFIN: TLFDbedit
              Left = 101
              Top = 113
              Width = 110
              Height = 21
              DataField = 'IDFAC_EMISOR_NUMSERIEFACFIN'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 5
            end
            object DBEPERIODOIMPOSITIVO_EJERCICIO: TLFDbedit
              Left = 101
              Top = 25
              Width = 110
              Height = 21
              DataField = 'PERIODOIMPOSITIVO_EJERCICIO'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 1
            end
            object DBEPERIODOIMPOSITIVO_PERIODO: TLFDbedit
              Left = 101
              Top = 47
              Width = 110
              Height = 21
              DataField = 'PERIODOIMPOSITIVO_PERIODO'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 2
            end
            object DBETIPO_DESGLOSE: TLFDbedit
              Left = 1053
              Top = 135
              Width = 110
              Height = 21
              DataField = 'TIPO_DESGLOSE'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 36
            end
            object DBETIPO_DESGLOSE_OPERACION: TLFDbedit
              Left = 1053
              Top = 157
              Width = 110
              Height = 21
              DataField = 'TIPO_DESGLOSE_OPERACION'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 37
            end
            object DBEEstadoRegistroEmitida: TLFDbedit
              Left = 101
              Top = 179
              Width = 110
              Height = 21
              DataField = 'ESTADO_REGISTRO'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 8
              OnChange = DBEEstadoRegistroRecibidaChange
            end
            object DBECODIGO_ERROR1: TLFDbedit
              Left = 227
              Top = 179
              Width = 110
              Height = 21
              DataField = 'CODIGO_ERROR'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 38
            end
            object DBEDESCRIPCION_ERROR1: TLFDbedit
              Left = 339
              Top = 179
              Width = 715
              Height = 21
              DataField = 'DESCRIPCION_ERROR'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 39
            end
            object DBETipoComunicacionEmi: TLFDbedit
              Left = 1164
              Top = 3
              Width = 22
              Height = 21
              DataField = 'TIPOCOMUNICACION_DESTINO'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              TabOrder = 41
            end
            object EIdPresentacionEmi: TLFEdit
              Left = 1053
              Top = 25
              Width = 110
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 42
            end
            object RBCBTipoComunicacionSuministroFacturasEmitidas: TRxDBComboBox
              Left = 0
              Top = 3
              Width = 73
              Height = 21
              Color = clInfoBk
              DataField = 'TIPOCOMUNICACION_DESTINO'
              DataSource = DMRegistroIVA.DSRLRFacEmi
              ItemHeight = 13
              Items.Strings = (
                'Alta'
                'Modificacion'
                'Baja')
              TabOrder = 40
              Values.Strings = (
                'A0'
                'A1'
                'A4')
            end
          end
          object PNLDesgloseFacturasEmitidas: TLFPanel
            Left = 0
            Top = 225
            Width = 1209
            Height = 138
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object DBGDesgloseFacturasEmitidas: TDBGridFind2000
              Left = 0
              Top = 29
              Width = 1209
              Height = 109
              Align = alClient
              BorderStyle = bsNone
              DataSource = DMSII.DSDesgloseFacEmi
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
              IndiceBitmapChecked = -1
              IndiceBitmapDescendente = 0
              BuscarNums = False
              CampoAOrdenarColor = clInfoBk
              MensajeNoExiste = False
              SalirSiVacio = False
              SalirSiNoExiste = False
              Posicion = tpCentrado
              OrdenMultiple = True
              Filtros = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ID_SII_DESGLOSEFACTURA_EMI'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPODESGLOSE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUJETA_EXENTA_CAUSA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUJETA_EXENTA_BASEIMPONIBLE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUJETA_NO_EXENTA_TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUJETA_NO_EXENTA_TIPOIMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUJETA_NO_EXENTA_BASEIMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUJETA_NO_EXENTA_CUOTAREP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUJETA_NO_EXENTA_TIPOREC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUJETA_NO_EXENTA_CUOTAREC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NO_SUJETA_IMPORTE_ART_7_14'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NO_SUJETA_IMPORTE_TAI'
                  Visible = True
                end>
            end
            object DBCGDesgloseFacEmi: TLFDBCtrlGrid
              Left = 0
              Top = 29
              Width = 1209
              Height = 109
              Align = alClient
              ColCount = 1
              DataSource = DMRegistroIVA.DSDesgloseFacEmi
              PanelBorder = gbNone
              PanelHeight = 109
              PanelWidth = 1193
              TabOrder = 1
              RowCount = 1
              object LFLabel75: TLFLabel
                Left = 88
                Top = 6
                Width = 9
                Height = 13
                Alignment = taRightJustify
                Caption = 'Id'
              end
              object LFLabel76: TLFLabel
                Left = 10
                Top = 28
                Width = 87
                Height = 13
                Alignment = taRightJustify
                Caption = 'Suj. Exenta Causa'
              end
              object LFLabel77: TLFLabel
                Left = 16
                Top = 50
                Width = 81
                Height = 13
                Alignment = taRightJustify
                Caption = 'Suj. Exenta Base'
              end
              object LFLabel78: TLFLabel
                Left = 473
                Top = 6
                Width = 100
                Height = 13
                Alignment = taRightJustify
                Caption = 'Suj. No Ex. Tipo Imp.'
              end
              object LFLabel79: TLFLabel
                Left = 493
                Top = 28
                Width = 80
                Height = 13
                Alignment = taRightJustify
                Caption = 'Suj. No Ex. Base'
              end
              object LFLabel80: TLFLabel
                Left = 463
                Top = 50
                Width = 110
                Height = 13
                Alignment = taRightJustify
                Caption = 'Suj. No Ex. Cuota Rep.'
              end
              object LFLabel81: TLFLabel
                Left = 710
                Top = 6
                Width = 103
                Height = 13
                Alignment = taRightJustify
                Caption = 'Suj. No Ex. Tipo Rec.'
              end
              object LFLabel82: TLFLabel
                Left = 705
                Top = 28
                Width = 110
                Height = 13
                Alignment = taRightJustify
                Caption = 'Suj. No Ex. Cuota Rec.'
              end
              object LFLabel83: TLFLabel
                Left = 940
                Top = 6
                Width = 111
                Height = 13
                Alignment = taRightJustify
                Caption = 'No sujeta Imp. Art 7, 14'
              end
              object LFLabel84: TLFLabel
                Left = 948
                Top = 28
                Width = 103
                Height = 13
                Alignment = taRightJustify
                Caption = 'No sujeta Importe TAI'
              end
              object LFLabel85: TLFLabel
                Left = 259
                Top = 6
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'Suj. No Ex. Tipo'
              end
              object DBEID_SII_DESGLOSEFACTURA_EMI: TLFDbedit
                Left = 101
                Top = 2
                Width = 110
                Height = 21
                DataField = 'ID_SII_DESGLOSEFACTURA_EMI'
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
                TabOrder = 0
              end
              object DBESUJETA_EXENTA_CAUSA: TLFDbedit
                Left = 101
                Top = 24
                Width = 110
                Height = 21
                DataField = 'SUJETA_EXENTA_CAUSA'
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
                TabOrder = 1
              end
              object DBESUJETA_EXENTA_BASEIMPONIBLE: TLFDbedit
                Left = 101
                Top = 46
                Width = 110
                Height = 21
                DataField = 'SUJETA_EXENTA_BASEIMPONIBLE'
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
                TabOrder = 2
              end
              object DBESUJETA_NO_EXENTA_TIPO: TLFDbedit
                Left = 339
                Top = 1
                Width = 110
                Height = 21
                DataField = 'SUJETA_NO_EXENTA_TIPO'
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
                TabOrder = 3
              end
              object DBESUJETA_NO_EXENTA_TIPOIMP: TLFDbedit
                Left = 577
                Top = 2
                Width = 110
                Height = 21
                DataField = 'SUJETA_NO_EXENTA_TIPOIMP'
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
                TabOrder = 4
              end
              object DBESUJETA_NO_EXENTA_BASEIMP: TLFDbedit
                Left = 577
                Top = 24
                Width = 110
                Height = 21
                DataField = 'SUJETA_NO_EXENTA_BASEIMP'
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
                TabOrder = 5
              end
              object DBESUJETA_NO_EXENTA_CUOTAREP: TLFDbedit
                Left = 577
                Top = 46
                Width = 110
                Height = 21
                DataField = 'SUJETA_NO_EXENTA_CUOTAREP'
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
                TabOrder = 6
              end
              object DBESUJETA_NO_EXENTA_TIPOREC: TLFDbedit
                Left = 817
                Top = 2
                Width = 110
                Height = 21
                DataField = 'SUJETA_NO_EXENTA_TIPOREC'
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
                TabOrder = 7
              end
              object DBESUJETA_NO_EXENTA_CUOTAREC: TLFDbedit
                Left = 817
                Top = 24
                Width = 110
                Height = 21
                DataField = 'SUJETA_NO_EXENTA_CUOTAREC'
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
                TabOrder = 8
              end
              object DBENO_SUJETA_IMPORTE_ART_7_14: TLFDbedit
                Left = 1053
                Top = 2
                Width = 110
                Height = 21
                DataField = 'NO_SUJETA_IMPORTE_ART_7_14'
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
                TabOrder = 9
              end
              object DBENO_SUJETA_IMPORTE_TAI: TLFDbedit
                Left = 1053
                Top = 24
                Width = 110
                Height = 21
                DataField = 'NO_SUJETA_IMPORTE_TAI'
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
                TabOrder = 10
              end
            end
            object TBDesgloseFacturasEmitidas: TLFToolBar
              Left = 0
              Top = 0
              Width = 1209
              Height = 29
              Caption = 'TBRegistroFacturasEmitidas'
              EdgeInner = esNone
              EdgeOuter = esNone
              TabOrder = 2
              Separators = True
              object NavDesgloseFacturasEmitidas: THYMNavigator
                Left = 0
                Top = 2
                Width = 240
                Height = 22
                DataSource = DMRegistroIVA.DSDesgloseFacEmi
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
            end
          end
        end
        object PNLSIIRecibidas: TLFPanel
          Left = 100
          Top = 216
          Width = 1210
          Height = 361
          BevelOuter = bvNone
          TabOrder = 1
          object TBSIIRecibidas: TLFToolBar
            Left = 0
            Top = 0
            Width = 1210
            Height = 22
            AutoSize = True
            EdgeBorders = []
            EdgeInner = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavSIIRecibidas: THYMNavigator
              Left = 0
              Top = 0
              Width = 220
              Height = 22
              DataSource = DMRegistroIVA.DSRLRFacRec
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
            object Butt2: TToolButton
              Left = 220
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object ButtGenerarModificacionRecibida: TToolButton
              Left = 228
              Top = 0
              Hint = 'Generar Registro de Modificacion'
              Caption = 'Generar Registro de Modificacion'
              ImageIndex = 8
              OnClick = ButtGenerarModificacionRecibidaClick
            end
            object ButtGenerarBajaRecibida: TToolButton
              Left = 251
              Top = 0
              Hint = 'Generar Registro de Baja'
              Caption = 'Generar Registro de Baja'
              ImageIndex = 6
              OnClick = ButtGenerarBajaRecibidaClick
            end
            object Butt4: TToolButton
              Left = 274
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtRegenerarSIIRecibidas: TToolButton
              Left = 282
              Top = 0
              Hint = 'Regenerar Registro SII'
              Caption = 'Regenerar Registro SII'
              ImageIndex = 7
              OnClick = TButtRegenerarSIIRecibidasClick
            end
            object TSep2: TToolButton
              Left = 305
              Top = 0
              Width = 8
              ImageIndex = 8
              Style = tbsSeparator
            end
            object TBDesvincularSIIRecibida: TToolButton
              Left = 313
              Top = 0
              Hint = 'Desvincular SII del registro deIVA'
              Caption = 'Desvincular SII del registro deIVA'
              ImageIndex = 69
              OnClick = TBDesvincularSIIRecibidaClick
            end
          end
          object PNLRegistroFacturasRecibidasDatos: TLFPanel
            Left = 0
            Top = 22
            Width = 1210
            Height = 203
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object LFLabel74: TLFLabel
              Left = 216
              Top = 140
              Width = 119
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Agr. N. Ser. F. Emi. Fin'
            end
            object LFLabel14: TLFLabel
              Left = 88
              Top = 7
              Width = 9
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id'
            end
            object LFLabel39: TLFLabel
              Left = 12
              Top = 29
              Width = 85
              Height = 13
              Alignment = taRightJustify
              Caption = 'Per. Imp. Ejercicio'
            end
            object LFLabel40: TLFLabel
              Left = 16
              Top = 51
              Width = 81
              Height = 13
              Alignment = taRightJustify
              Caption = 'Per. Imp. Periodo'
            end
            object LFLabel41: TLFLabel
              Left = 46
              Top = 73
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emisor NIF'
            end
            object LFLabel42: TLFLabel
              Left = 18
              Top = 95
              Width = 79
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emisor Cod. Pais'
            end
            object LFLabel43: TLFLabel
              Left = 30
              Top = 117
              Width = 67
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emisor IdType'
            end
            object LFLabel44: TLFLabel
              Left = 54
              Top = 139
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emisor Id'
            end
            object LFLabel45: TLFLabel
              Left = 223
              Top = 29
              Width = 113
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emi. N. Serie F. Emi. Fin'
            end
            object LFLabel46: TLFLabel
              Left = 227
              Top = 51
              Width = 110
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emisor Fec. Expedicion'
            end
            object LFLabel47: TLFLabel
              Left = 277
              Top = 73
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Factura'
            end
            object LFLabel48: TLFLabel
              Left = 254
              Top = 95
              Width = 83
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Rectificativa'
            end
            object LFLabel49: TLFLabel
              Left = 246
              Top = 161
              Width = 91
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Agr. Fec. Exped.'
            end
            object LFLabel50: TLFLabel
              Left = 461
              Top = 7
              Width = 114
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Rect. N. Serie F. Emi.'
            end
            object LFLabel51: TLFLabel
              Left = 475
              Top = 29
              Width = 98
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Rect. Fec. Exped.'
            end
            object LFLabel52: TLFLabel
              Left = 508
              Top = 51
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Rect. Base'
            end
            object LFLabel53: TLFLabel
              Left = 504
              Top = 73
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Rect. Cuota'
            end
            object LFLabel54: TLFLabel
              Left = 478
              Top = 95
              Width = 95
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Rect. Cuota Rec.'
            end
            object LFLabel55: TLFLabel
              Left = 977
              Top = 51
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fec. Operacion'
            end
            object LFLabel56: TLFLabel
              Left = 496
              Top = 117
              Width = 77
              Height = 13
              Alignment = taRightJustify
              Caption = 'Clave Reg. Esp.'
            end
            object LFLabel57: TLFLabel
              Left = 487
              Top = 139
              Width = 86
              Height = 13
              Alignment = taRightJustify
              Caption = 'Clave Reg. Esp. 1'
            end
            object LFLabel58: TLFLabel
              Left = 487
              Top = 161
              Width = 86
              Height = 13
              Alignment = taRightJustify
              Caption = 'Clave Reg. Esp. 2'
            end
            object LFLabel59: TLFLabel
              Left = 697
              Top = 6
              Width = 114
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. Nombre Razon'
            end
            object LFLabel60: TLFLabel
              Left = 751
              Top = 29
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. NIF'
            end
            object LFLabel61: TLFLabel
              Left = 722
              Top = 51
              Width = 89
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. NIF Repr.'
            end
            object LFLabel62: TLFLabel
              Left = 723
              Top = 73
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. Cod. Pais'
            end
            object LFLabel63: TLFLabel
              Left = 735
              Top = 94
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. IdType'
            end
            object LFLabel64: TLFLabel
              Left = 759
              Top = 116
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contrap. Id'
            end
            object LFLabel65: TLFLabel
              Left = 946
              Top = 73
              Width = 104
              Height = 13
              Alignment = taRightJustify
              Caption = 'N. Reg. Acuedro Fac.'
            end
            object LFLabel66: TLFLabel
              Left = 988
              Top = 95
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Importe Total'
            end
            object LFLabel67: TLFLabel
              Left = 963
              Top = 116
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Base Imp. A Coste'
            end
            object LFLabel68: TLFLabel
              Left = 41
              Top = 161
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'Descripcion'
            end
            object LFLabel69: TLFLabel
              Left = 715
              Top = 138
              Width = 96
              Height = 13
              Alignment = taRightJustify
              Caption = 'Aduanas Num. DUA'
            end
            object LFLabel70: TLFLabel
              Left = 667
              Top = 160
              Width = 143
              Height = 13
              Alignment = taRightJustify
              Caption = 'Aduanas Fec. Reg. Con. DUA'
            end
            object LFLabel71: TLFLabel
              Left = 957
              Top = 160
              Width = 92
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fec. Reg. Contable'
            end
            object LFLabel72: TLFLabel
              Left = 971
              Top = 138
              Width = 79
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cuota Deducible'
            end
            object LFLabel73: TLFLabel
              Left = 229
              Top = 7
              Width = 107
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emisor N. Serie F. Emi.'
            end
            object LEstadoRegistro: TLFLabel
              Left = 22
              Top = 182
              Width = 75
              Height = 13
              Alignment = taRightJustify
              Caption = 'Estado Registro'
            end
            object LIdPresentacinoRec: TLFLabel
              Left = 974
              Top = 30
              Width = 74
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id Presentacion'
            end
            object DBEFACREC_ADUANAS_FECHAREGCONTDUA: TLFDbedit
              Left = 815
              Top = 157
              Width = 110
              Height = 21
              DataField = 'FACREC_ADUANAS_FECHAREGCONTDUA'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 31
            end
            object DBEFACREC_ADUANAS_NUMERODUA: TLFDbedit
              Left = 815
              Top = 135
              Width = 110
              Height = 21
              DataField = 'FACREC_ADUANAS_NUMERODUA'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 30
            end
            object DBEFACREC_BASEIMPONIBLEACOSTE: TLFDbedit
              Left = 1053
              Top = 113
              Width = 110
              Height = 21
              DataField = 'FACREC_BASEIMPONIBLEACOSTE'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 35
            end
            object DBEFACREC_CLAVE_REG_ESP: TLFDbedit
              Left = 577
              Top = 113
              Width = 110
              Height = 21
              DataField = 'FACREC_CLAVE_REG_ESP'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 21
            end
            object DBEFACREC_CLAVE_REG_ESP1: TLFDbedit
              Left = 577
              Top = 135
              Width = 110
              Height = 21
              DataField = 'FACREC_CLAVE_REG_ESP1'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 22
            end
            object DBEFACREC_CLAVE_REG_ESP2: TLFDbedit
              Left = 577
              Top = 157
              Width = 110
              Height = 21
              DataField = 'FACREC_CLAVE_REG_ESP2'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 23
            end
            object DBEFACREC_CONTRAP_NIF: TLFDbedit
              Left = 815
              Top = 25
              Width = 110
              Height = 21
              DataField = 'FACREC_CONTRAP_NIF'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 25
            end
            object DBEFACREC_CONTRAP_NIF_REPRES: TLFDbedit
              Left = 815
              Top = 47
              Width = 110
              Height = 21
              DataField = 'FACREC_CONTRAP_NIF_REPRES'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 26
            end
            object DBEFACREC_CONTRAP_NOMBRE_RAZON: TLFDbedit
              Left = 816
              Top = 3
              Width = 348
              Height = 21
              DataField = 'FACREC_CONTRAP_NOMBRE_RAZON'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 24
            end
            object DBEFACREC_CONTRAPARTE_CODPAIS: TLFDbedit
              Left = 815
              Top = 69
              Width = 110
              Height = 21
              DataField = 'FACREC_CONTRAPARTE_CODPAIS'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 27
            end
            object DBEFACREC_CONTRAPARTE_ID: TLFDbedit
              Left = 815
              Top = 113
              Width = 110
              Height = 21
              DataField = 'FACREC_CONTRAPARTE_ID'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 29
            end
            object DBEFACREC_CONTRAPARTE_IDTYPE: TLFDbedit
              Left = 815
              Top = 91
              Width = 110
              Height = 21
              DataField = 'FACREC_CONTRAPARTE_IDTYPE'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 28
            end
            object DBEFACREC_CUOTA_DEDUCIBLE: TLFDbedit
              Left = 1053
              Top = 135
              Width = 110
              Height = 21
              DataField = 'FACREC_CUOTA_DEDUCIBLE'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 36
            end
            object DBEFACREC_DESCRIPCION: TLFDbedit
              Left = 101
              Top = 157
              Width = 110
              Height = 21
              DataField = 'FACREC_DESCRIPCION'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 7
            end
            object DBEFACREC_FAGR_FECHAEXPEDICION: TLFDbedit
              Left = 339
              Top = 157
              Width = 110
              Height = 21
              DataField = 'FACREC_FAGR_FECHAEXPEDICION'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 15
            end
            object DBEFACREC_FAGR_NUMSERIEFACEMISOR: TLFDbedit
              Left = 339
              Top = 135
              Width = 110
              Height = 21
              DataField = 'FACREC_FAGR_NUMSERIEFACEMISOR'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 14
            end
            object DBEFACREC_FECHAOPERACION: TLFDbedit
              Left = 1053
              Top = 47
              Width = 110
              Height = 21
              DataField = 'FACREC_FECHAOPERACION'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 32
            end
            object DBEFACREC_FECHAREGCONTABLE: TLFDbedit
              Left = 1053
              Top = 157
              Width = 110
              Height = 21
              DataField = 'FACREC_FECHAREGCONTABLE'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 37
            end
            object DBEFACREC_FRECT_FECHAEXPEDICION: TLFDbedit
              Left = 577
              Top = 25
              Width = 110
              Height = 21
              DataField = 'FACREC_FRECT_FECHAEXPEDICION'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 17
            end
            object DBEFACREC_FRECT_NUMSERIEFACEMISOR: TLFDbedit
              Left = 577
              Top = 3
              Width = 110
              Height = 21
              DataField = 'FACREC_FRECT_NUMSERIEFACEMISOR'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 16
            end
            object DBEFACREC_IMPORTE_TOTAL: TLFDbedit
              Left = 1053
              Top = 91
              Width = 110
              Height = 21
              DataField = 'FACREC_IMPORTE_TOTAL'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 34
            end
            object DBEFACREC_IMPRECT_BASERECT: TLFDbedit
              Left = 577
              Top = 47
              Width = 110
              Height = 21
              DataField = 'FACREC_IMPRECT_BASERECT'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 18
            end
            object DBEFACREC_IMPRECT_CUOTARECRECT: TLFDbedit
              Left = 577
              Top = 91
              Width = 110
              Height = 21
              DataField = 'FACREC_IMPRECT_CUOTARECRECT'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 20
            end
            object DBEFACREC_IMPRECT_CUOTARECT: TLFDbedit
              Left = 577
              Top = 69
              Width = 110
              Height = 21
              DataField = 'FACREC_IMPRECT_CUOTARECT'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 19
            end
            object DBEFACREC_NUMREGACUERDOFAC: TLFDbedit
              Left = 1053
              Top = 69
              Width = 110
              Height = 21
              DataField = 'FACREC_NUMREGACUERDOFAC'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 33
            end
            object DBEFACREC_TIPOFACTURA: TLFDbedit
              Left = 339
              Top = 69
              Width = 110
              Height = 21
              DataField = 'FACREC_TIPOFACTURA'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 12
            end
            object DBEFACREC_TIPORECTIFICATIVA: TLFDbedit
              Left = 339
              Top = 91
              Width = 110
              Height = 21
              DataField = 'FACREC_TIPORECTIFICATIVA'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 13
            end
            object DBEID_SII_REGLRFACTURASRECIBIDAS: TLFDbedit
              Left = 101
              Top = 3
              Width = 110
              Height = 21
              DataField = 'ID_SII_REGLRFACTURASRECIBIDAS'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 0
              OnChange = DBEID_SII_REGLRFACTURASRECIBIDASChange
            end
            object DBEIDFAC_EMISOR_FECHA_EXPEDICION: TLFDbedit
              Left = 339
              Top = 47
              Width = 110
              Height = 21
              DataField = 'IDFAC_EMISOR_FECHA_EXPEDICION'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 11
            end
            object DBEIDFAC_EMISOR_NIF1: TLFDbedit
              Left = 101
              Top = 69
              Width = 110
              Height = 21
              DataField = 'IDFAC_EMISOR_NIF'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 3
            end
            object DBEIDFAC_EMISOR_NUMSERIEFAC1: TLFDbedit
              Left = 339
              Top = 3
              Width = 110
              Height = 21
              DataField = 'IDFAC_EMISOR_NUMSERIEFAC'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 9
            end
            object DBEIDFAC_EMISOR_NUMSERIEFACFIN1: TLFDbedit
              Left = 339
              Top = 25
              Width = 110
              Height = 21
              DataField = 'IDFAC_EMISOR_NUMSERIEFACFIN'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 10
            end
            object DBEIDFAC_EMISOR_OTRO_CODPAIS: TLFDbedit
              Left = 101
              Top = 91
              Width = 110
              Height = 21
              DataField = 'IDFAC_EMISOR_OTRO_CODPAIS'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 4
            end
            object DBEIDFAC_EMISOR_OTRO_ID: TLFDbedit
              Left = 101
              Top = 135
              Width = 110
              Height = 21
              DataField = 'IDFAC_EMISOR_OTRO_ID'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 6
            end
            object DBEIDFAC_EMISOR_OTRO_IDTYPE: TLFDbedit
              Left = 101
              Top = 113
              Width = 110
              Height = 21
              DataField = 'IDFAC_EMISOR_OTRO_IDTYPE'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 5
            end
            object DBEPERIODOIMPOSITIVO_EJERCICIO1: TLFDbedit
              Left = 101
              Top = 25
              Width = 110
              Height = 21
              DataField = 'PERIODOIMPOSITIVO_EJERCICIO'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 1
            end
            object DBEPERIODOIMPOSITIVO_PERIODO1: TLFDbedit
              Left = 101
              Top = 47
              Width = 110
              Height = 21
              DataField = 'PERIODOIMPOSITIVO_PERIODO'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 2
            end
            object DBEEstadoRegistroRecibida: TLFDbedit
              Left = 101
              Top = 179
              Width = 110
              Height = 21
              DataField = 'ESTADO_REGISTRO'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 8
              OnChange = DBEEstadoRegistroRecibidaChange
            end
            object DBECODIGO_ERROR: TLFDbedit
              Left = 228
              Top = 179
              Width = 110
              Height = 21
              DataField = 'CODIGO_ERROR'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 38
            end
            object DBEDESCRIPCION_ERROR: TLFDbedit
              Left = 339
              Top = 179
              Width = 715
              Height = 21
              DataField = 'DESCRIPCION_ERROR'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 39
            end
            object DBETipoComunicacionRec: TLFDbedit
              Left = 1164
              Top = 3
              Width = 22
              Height = 21
              DataField = 'TIPOCOMUNICACION_DESTINO'
              DataSource = DMRegistroIVA.DSRLRFacRec
              TabOrder = 41
            end
            object EIdPresentacionRec: TLFEdit
              Left = 1053
              Top = 25
              Width = 110
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 42
            end
            object RBCBTipoComunicacionSuministroFacturasRecibidas: TRxDBComboBox
              Left = 0
              Top = 3
              Width = 73
              Height = 21
              Color = clInfoBk
              DataField = 'TIPOCOMUNICACION_DESTINO'
              DataSource = DMRegistroIVA.DSRLRFacRec
              ItemHeight = 13
              Items.Strings = (
                'Alta'
                'Modificacion'
                'Baja')
              TabOrder = 40
              Values.Strings = (
                'A0'
                'A1'
                'A4')
            end
          end
          object PNLDesgloseRegistroFacturasRecibidas: TLFPanel
            Left = 0
            Top = 225
            Width = 1210
            Height = 136
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object TBDesgloseRegistroFacturasRecibidas: TLFToolBar
              Left = 0
              Top = 0
              Width = 1210
              Height = 29
              Caption = 'TBRegistroFacturasEmitidas'
              EdgeInner = esNone
              EdgeOuter = esNone
              TabOrder = 0
              Separators = True
              object NavDesgloseRegistroFacturasRecibidas: THYMNavigator
                Left = 0
                Top = 2
                Width = 240
                Height = 22
                DataSource = DMRegistroIVA.DSDesgloseFacRec
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
            end
            object DBCGDesgloseFacRec: TLFDBCtrlGrid
              Left = 0
              Top = 29
              Width = 1210
              Height = 107
              Align = alClient
              ColCount = 1
              DataSource = DMRegistroIVA.DSDesgloseFacRec
              PanelBorder = gbNone
              PanelHeight = 107
              PanelWidth = 1194
              TabOrder = 1
              RowCount = 1
              object LFLabel86: TLFLabel
                Left = 88
                Top = 6
                Width = 9
                Height = 13
                Alignment = taRightJustify
                Caption = 'Id'
              end
              object LFLabel87: TLFLabel
                Left = 711
                Top = 6
                Width = 100
                Height = 13
                Alignment = taRightJustify
                Caption = 'I.S.P. Tipo Impositivo'
              end
              object LFLabel88: TLFLabel
                Left = 758
                Top = 28
                Width = 53
                Height = 13
                Alignment = taRightJustify
                Caption = 'I.S.P. Base'
              end
              object LFLabel89: TLFLabel
                Left = 941
                Top = 6
                Width = 95
                Height = 13
                Alignment = taRightJustify
                Caption = 'I.S.P. Tipo Rec. Eq.'
              end
              object LFLabel90: TLFLabel
                Left = 934
                Top = 28
                Width = 102
                Height = 13
                Alignment = taRightJustify
                Caption = 'I.S.P. Cuota Rec. Eq.'
              end
              object LFLabel91: TLFLabel
                Left = 244
                Top = 6
                Width = 91
                Height = 13
                Alignment = taRightJustify
                Caption = 'D.I. Tipo Impositivo'
              end
              object LFLabel92: TLFLabel
                Left = 291
                Top = 28
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'D.I. Base'
              end
              object LFLabel93: TLFLabel
                Left = 289
                Top = 50
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'D.I. Cuota'
              end
              object LFLabel94: TLFLabel
                Left = 488
                Top = 6
                Width = 86
                Height = 13
                Alignment = taRightJustify
                Caption = 'D.I. Tipo Rec. Eq.'
              end
              object LFLabel95: TLFLabel
                Left = 481
                Top = 28
                Width = 93
                Height = 13
                Alignment = taRightJustify
                Caption = 'D.I. Cuota Rec. Eq.'
              end
              object LFLabel96: TLFLabel
                Left = 755
                Top = 50
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'I.S.P. Cuota'
              end
              object LFLabel97: TLFLabel
                Left = -29
                Top = 28
                Width = 125
                Height = 13
                Hint = 'Desglose IVA Porcentaje Compensacion REAGYP'
                Alignment = taRightJustify
                Caption = 'D.I. Porc. Comp. REAGYP'
                ParentShowHint = False
                ShowHint = True
              end
              object LFLabel98: TLFLabel
                Left = -43
                Top = 50
                Width = 140
                Height = 13
                Hint = 'Desglose IVA Importe Compensacion REAGYP'
                Alignment = taRightJustify
                Caption = 'D.I. D.I. Imp. Comp. REAGYP'
                ParentShowHint = False
                ShowHint = True
              end
              object DBEID_SII_DESGLOSEFACTURA_REC: TLFDbedit
                Left = 100
                Top = 2
                Width = 110
                Height = 21
                DataField = 'ID_SII_DESGLOSEFACTURA_REC'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 0
              end
              object DBEISP_TIPOIMPOSITIVO: TLFDbedit
                Left = 815
                Top = 2
                Width = 110
                Height = 21
                DataField = 'ISP_TIPOIMPOSITIVO'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 8
              end
              object DBEISP_BASEIMPONIBLE: TLFDbedit
                Left = 815
                Top = 24
                Width = 110
                Height = 21
                DataField = 'ISP_BASEIMPONIBLE'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 9
              end
              object DBEISP_CUOTASOPORTADA: TLFDbedit
                Left = 815
                Top = 46
                Width = 110
                Height = 21
                DataField = 'ISP_CUOTASOPORTADA'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 10
              end
              object DBEISP_TIPORECARGOEQUIVALENCIA: TLFDbedit
                Left = 1040
                Top = 2
                Width = 110
                Height = 21
                DataField = 'ISP_TIPORECARGOEQUIVALENCIA'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 11
              end
              object DBEISP_CUOTARECARGOEQUIVALENCIA: TLFDbedit
                Left = 1040
                Top = 24
                Width = 110
                Height = 21
                DataField = 'ISP_CUOTARECARGOEQUIVALENCIA'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 12
              end
              object DBEDI_TIPOIMPOSITIVO: TLFDbedit
                Left = 339
                Top = 2
                Width = 110
                Height = 21
                DataField = 'DI_TIPOIMPOSITIVO'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 3
              end
              object DBEDI_BASEIMPONIBLE: TLFDbedit
                Left = 339
                Top = 24
                Width = 110
                Height = 21
                DataField = 'DI_BASEIMPONIBLE'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 4
              end
              object DBEDI_CUOTASOPORTADA: TLFDbedit
                Left = 339
                Top = 46
                Width = 110
                Height = 21
                DataField = 'DI_CUOTASOPORTADA'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 5
              end
              object DBEDI_TIPORECARGOEQUIVALENCIA: TLFDbedit
                Left = 577
                Top = 2
                Width = 110
                Height = 21
                DataField = 'DI_TIPORECARGOEQUIVALENCIA'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 6
              end
              object DBEDI_CUOTARECARGOEQUIVALENCIA: TLFDbedit
                Left = 577
                Top = 24
                Width = 110
                Height = 21
                DataField = 'DI_CUOTARECARGOEQUIVALENCIA'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 7
              end
              object DBEDI_PORCENTCOMPSENSACIONREAGYP: TLFDbedit
                Left = 100
                Top = 24
                Width = 110
                Height = 21
                DataField = 'DI_PORCENTCOMPSENSACIONREAGYP'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 1
              end
              object DBEDI_IMPORTECOMPSENSACIONREAGYP: TLFDbedit
                Left = 100
                Top = 46
                Width = 110
                Height = 21
                DataField = 'DI_IMPORTECOMPSENSACIONREAGYP'
                DataSource = DMRegistroIVA.DSDesgloseFacRec
                TabOrder = 2
              end
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1457
          Height = 614
          Cursor = crArrow
          DataSource = DMRegistroIVA.DSQMRegistroIVA
          CamposAMarcar.Strings = (
            'ANULADO'
            'EMITIDA_POR_TERCEROS'
            'RECC')
          CamposChecked.Strings = (
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'ANULADO'
            'CUENTA'
            'DESCRIPCION_CTA'
            'DOC_FECHA'
            'DOC_NUMERO'
            'DOC_SERIE'
            'DOC_TIPO'
            'EMITIDA_POR_TERCEROS'
            'FECHA_REGISTRO'
            'LIQUIDO'
            'MODO'
            'NIF'
            'NUM_FACTURA'
            'RECC'
            'REGISTRO'
            'RETENCION'
            'RIG_VISIBLE'
            'S_BASES'
            'S_IMPUESTO_ADICIONAL'
            'S_IVAS'
            'S_RECARGOS'
            'TERCERO')
          Columns = <
            item
              Expanded = False
              FieldName = 'SIGNO'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_VISIBLE'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REGISTRO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_CTA'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NUMERO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_SERIE'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_FECHA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODO'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_FACTURA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NIF'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 672
    Width = 1469
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    FichaExclusiva = nil
    Left = 452
    Top = 248
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 502
    Top = 248
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
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
    Left = 372
    Top = 32
    object AListadoIVA: TAction
      Category = 'Listados'
      Caption = 'Listado de IVA'
      Hint = 'Listado de IVA'
      ImageIndex = 14
      OnExecute = AListadoIVAExecute
    end
    object ARenumerar: TAction
      Category = 'Procesos'
      Caption = 'Renumerar n'#250'meros de registro'
      Hint = 'Renumerar n'#250'meros de registro'
      ImageIndex = 122
      OnExecute = ARenumerarExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AExportarExcel: TAction
      Category = 'Procesos'
      Caption = 'Exportar a Excel Todo'
      Hint = 'Genera fichero Excel del Registro de IVA'
      ImageIndex = 36
      OnExecute = AExportarExcelExecute
    end
    object AExportarExcelPrimerTrimestre: TAction
      Tag = 1
      Category = 'Procesos'
      Caption = 'Exportar a Excel 1er Trimestre'
      Hint = 'Genera fichero Excel del Registro de IVA (1er Trimestre)'
      OnExecute = AExportarExcelExecute
    end
    object AExportarExcelSegundoTrimestre: TAction
      Tag = 2
      Category = 'Procesos'
      Caption = 'Exportar a Excel 2do Trimestre'
      Hint = 'Genera fichero Excel del Registro de IVA (2do Trimestre)'
      OnExecute = AExportarExcelExecute
    end
    object AExportarExcelTercerTrimestre: TAction
      Tag = 3
      Category = 'Procesos'
      Caption = 'Exportar a Excel 3er Trimestre'
      Hint = 'Genera fichero Excel del Registro de IVA (3er Trimestre)'
      OnExecute = AExportarExcelExecute
    end
    object AExportarExcelCuartoTrimestre: TAction
      Tag = 4
      Category = 'Procesos'
      Caption = 'Exportar a Excel 4to Trimestre'
      Hint = 'Genera fichero Excel del Registro de IVA (4t Trimestre)'
      OnExecute = AExportarExcelExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 428
    Top = 28
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 452
    Top = 286
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 502
    Top = 286
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
