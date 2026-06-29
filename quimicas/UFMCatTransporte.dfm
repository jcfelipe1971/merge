inherited FMCatTransporte: TFMCatTransporte
  Left = 214
  Top = 202
  Caption = 'Claves ADR'
  ClientHeight = 422
  ClientWidth = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 398
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = DMCatTransporte.DSQMCatTransporte
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 75
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 303
      end
      inherited TbuttComp: TToolButton
        Left = 311
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 368
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 340
          inherited G2KTableLoc: TG2KTBLoc
            Left = 8
            Top = 4
            DataSource = DMCatTransporte.DSQMCatTransporte
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_QUI_CATEGORIAS_TRANSPORTE'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LblCodigo: TLFLabel
            Left = 49
            Top = 8
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LblDescripcion: TLFLabel
            Left = 26
            Top = 30
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LblNumUN: TLFLabel
            Left = 38
            Top = 96
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'm. UN'
          end
          object LblClase: TLFLabel
            Left = 55
            Top = 118
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clase'
          end
          object LblPackingGroup: TLFLabel
            Left = 11
            Top = 184
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Packing Group'
          end
          object LblEtiquetas: TLFLabel
            Left = 38
            Top = 227
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Etiquetas'
          end
          object LblProvisionesEsp: TLFLabel
            Left = 6
            Top = 205
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Provisiones Esp.'
          end
          object LblCantLim: TLFLabel
            Left = 321
            Top = 96
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cant. Limitadas'
          end
          object LblEnvasado: TLFLabel
            Left = 345
            Top = 118
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Envasado'
          end
          object LblTanqueUNPort: TLFLabel
            Left = 302
            Top = 140
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tanque UN Port'#225'til'
          end
          object LblTanqueADR: TLFLabel
            Left = 330
            Top = 163
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tanque ADR'
          end
          object LblVehiculoTanque: TLFLabel
            Left = 310
            Top = 184
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Veh'#237'culo Tanque'
          end
          object LblCatTransp: TLFLabel
            Left = 9
            Top = 76
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cat. Transporte'
          end
          object LblIdentRiesgos: TLFLabel
            Left = 325
            Top = 207
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ident. Riesgos'
          end
          object LblConsidEsp: TLFLabel
            Left = 23
            Top = 250
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Consid. Esp.'
          end
          object LblCritSel: TLFLabel
            Left = 13
            Top = 51
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Crit. Selecci'#243'n'
          end
          object LblApartado: TLFLabel
            Left = 39
            Top = 139
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Apartado'
          end
          object LblLetra: TLFLabel
            Left = 58
            Top = 161
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Letra'
          end
          object LblNaturPeligro: TLFLabel
            Left = 23
            Top = 272
            Width = 103
            Height = 13
            Alignment = taRightJustify
            Caption = 'Naturaleza del Peligro'
          end
          object LblMedidasProteccion: TLFLabel
            Left = 17
            Top = 294
            Width = 109
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medidas de Protecci'#243'n'
          end
          object LblCodClasif: TLFLabel
            Left = 185
            Top = 227
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'd. Clasif.'
          end
          object LCodigoRestriccionT: TLFLabel
            Left = 302
            Top = 227
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Restricci'#243'n T.'
          end
          object DBECodigo: TLFDbedit
            Left = 86
            Top = 4
            Width = 80
            Height = 21
            Color = clInfoBk
            DataField = 'CODIGO'
            DataSource = DMCatTransporte.DSQMCatTransporte
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 86
            Top = 26
            Width = 481
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 1
          end
          object DBCBActivo: TLFDBCheckBox
            Left = 514
            Top = 8
            Width = 53
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 22
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMCatTransporte.DSQMCatTransporte
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBENumUN: TLFDbedit
            Left = 86
            Top = 92
            Width = 92
            Height = 21
            DataField = 'NUMERO_UN'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 4
          end
          object DBEClase: TLFDbedit
            Left = 86
            Top = 114
            Width = 92
            Height = 21
            DataField = 'CLASE'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 5
          end
          object DBEPackingGroup: TLFDbedit
            Left = 86
            Top = 180
            Width = 92
            Height = 21
            DataField = 'PACKING_GROUP'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 8
          end
          object DBEEtiquetas: TLFDbedit
            Left = 86
            Top = 224
            Width = 92
            Height = 21
            DataField = 'ETIQUETAS'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 10
          end
          object DBEProvisEsp: TLFDbedit
            Left = 86
            Top = 202
            Width = 92
            Height = 21
            DataField = 'PROVISIONES_ESP'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 9
          end
          object DBECantLim: TLFDbedit
            Left = 397
            Top = 92
            Width = 170
            Height = 21
            DataField = 'CANTIDADES_LIMITADAS'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 12
          end
          object DBEEnvasado: TLFDbedit
            Left = 397
            Top = 114
            Width = 170
            Height = 21
            DataField = 'ENVASADO'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 13
          end
          object DBETanquePortatil: TLFDbedit
            Left = 397
            Top = 136
            Width = 170
            Height = 21
            DataField = 'TANQUE_PORTATIL'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 14
          end
          object DBETanqueUN: TLFDbedit
            Left = 397
            Top = 158
            Width = 170
            Height = 21
            DataField = 'TANQUE_UN'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 15
          end
          object DBEVehiculoTanque: TLFDbedit
            Left = 397
            Top = 180
            Width = 170
            Height = 21
            DataField = 'VEHICULO_TANQUES'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 16
          end
          object DBEConsidEsp: TLFDbedit
            Left = 86
            Top = 246
            Width = 481
            Height = 21
            DataField = 'CONSIDERACIONES_ESP'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 19
          end
          object DBEIdentRiesgos: TLFDbedit
            Left = 397
            Top = 202
            Width = 170
            Height = 21
            DataField = 'IDENTIFICACION_RIESGOS'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 17
          end
          object DBCBVCatTransp: TDBComboBoxValue
            Left = 86
            Top = 70
            Width = 145
            Height = 21
            Style = csDropDownList
            DataField = 'CATEGORIA_TRANSPORTE'
            DataSource = DMCatTransporte.DSQMCatTransporte
            ItemHeight = 13
            Items.Strings = (
              'Cat. 0 : ADR Obligatorio'
              'Cat. 1 : Valor 50'
              'Cat. 2 : Valor 3'
              'Cat. 3 : Valor 1'
              'Cat. 4 : Valor 0')
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4')
            TabOrder = 3
          end
          object DBECriterioSeleccion: TLFDbedit
            Left = 86
            Top = 48
            Width = 481
            Height = 21
            DataField = 'CRITERIO_SELECCION'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 2
          end
          object DBEApartado: TLFDbedit
            Left = 86
            Top = 136
            Width = 92
            Height = 21
            DataField = 'APARTADO'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 6
          end
          object DBELetra: TLFDbedit
            Left = 86
            Top = 158
            Width = 92
            Height = 21
            DataField = 'LETRA'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 7
          end
          object DBEFNaturPeligro: TLFDBEditFind2000
            Left = 130
            Top = 268
            Width = 58
            Height = 21
            DataField = 'COD_NATURALEZA_PELIGRO'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 20
            OnChange = DBEFNaturPeligroChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_QUI_NATURALEZA_PELIGRO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'COD_NATURALEZA_PELIGRO'
            CampoStr = 'DESCRIPCION_CORTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'COD_NATURALEZA_PELIGRO')
            Filtros = []
          end
          object DBEFMedidasProtec: TLFDBEditFind2000
            Left = 130
            Top = 290
            Width = 58
            Height = 21
            DataField = 'COD_MEDIDAS_PROTECCION'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 21
            OnChange = DBEFMedidasProtecChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_QUI_MEDIDAS_PROTECCION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'COD_MEDIDAS_PROTECCION'
            CampoStr = 'DESCRIPCION_CORTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'COD_MEDIDAS_PROTECCION')
            Filtros = []
          end
          object DescNaturPeligro: TLFHYDBDescription
            Left = 189
            Top = 268
            Width = 378
            Height = 21
            Color = clInfoBk
            DataSource = DMCatTransporte.DSQMCatTransporte
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 23
            Tabla_a_buscar = 'SYS_QUI_NATURALEZA_PELIGRO'
            Campo_Descripcion = 'DESCRIPCION_CORTA'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'COD_NATURALEZA_PELIGRO')
            CamposWhereTabla.Strings = (
              'COD_NATURALEZA_PELIGRO')
          end
          object DescMedidasProtec: TLFHYDBDescription
            Left = 189
            Top = 290
            Width = 378
            Height = 21
            Color = clInfoBk
            DataSource = DMCatTransporte.DSQMCatTransporte
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 24
            Tabla_a_buscar = 'SYS_QUI_MEDIDAS_PROTECCION'
            Campo_Descripcion = 'DESCRIPCION_CORTA'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'COD_MEDIDAS_PROTECCION')
            CamposWhereTabla.Strings = (
              'COD_MEDIDAS_PROTECCION')
          end
          object DBECodClasif: TLFDbedit
            Left = 240
            Top = 224
            Width = 49
            Height = 21
            DataField = 'COD_CLASIF'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 11
          end
          object DBERestricTunel: TLFDbedit
            Left = 397
            Top = 224
            Width = 170
            Height = 21
            DataField = 'COD_RESTRICCION_TUNEL'
            DataSource = DMCatTransporte.DSQMCatTransporte
            TabOrder = 18
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 340
          DataSource = DMCatTransporte.DSQMCatTransporte
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'CODIGO'
            'DESCRIPCION')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 461
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_UN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLASE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PACKING_GROUP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ETIQUETAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVISIONES_ESP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDADES_LIMITADAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENVASADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TANQUE_PORTATIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TANQUE_UN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VEHICULO_TANQUES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CATEGORIA_TRANSPORTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONSIDERACIONES_ESP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDENTIFICACION_RIESGOS'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 590
  end
  inherited CEMain: TControlEdit
    Left = 456
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 524
    Top = 12
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 362
    Top = 14
  end
end
