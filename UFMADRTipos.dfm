inherited FMADRTipos: TFMADRTipos
  Left = 253
  Top = 215
  Width = 836
  Height = 628
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Claves ADR'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 826
    Height = 575
    inherited TBMain: TLFToolBar
      Width = 822
      inherited NavMain: THYMNavigator
        DataSource = DMADRTipos.DSQMADRTipos
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
      Width = 822
      Height = 545
      ActivePage = TSTabla
      TabIndex = 1
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 814
          Height = 517
          inherited G2KTableLoc: TG2KTBLoc
            Left = 56
            Top = 4
            CamposADesplegar.Strings = (
              'UN_NUMBER')
            DataSource = DMADRTipos.DSQMADRTipos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ADR_TIPOS'
            CampoNum = 'ID'
            CampoStr = 'NAME'
            OrdenadoPor.Strings = (
              'ID')
          end
          object LCodigo: TLFLabel
            Left = 121
            Top = 8
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LName: TLFLabel
            Left = 98
            Top = 52
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LUNNumber: TLFLabel
            Left = 110
            Top = 30
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'm. UN'
          end
          object LClase: TLFLabel
            Left = 128
            Top = 74
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clase'
          end
          object LPackingGroup: TLFLabel
            Left = 79
            Top = 118
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo Embalaje'
          end
          object LLabels: TLFLabel
            Left = 110
            Top = 139
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Etiquetas'
          end
          object LSpecialProvisions: TLFLabel
            Left = 76
            Top = 231
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Provisiones Esp.'
          end
          object LLimitedQuantity: TLFLabel
            Left = 504
            Top = 183
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cant. Limitadas'
          end
          object LADRTankCode: TLFLabel
            Left = 54
            Top = 390
            Width = 99
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo Tanque ADR'
          end
          object LVehicle: TLFLabel
            Left = 110
            Top = 323
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Veh'#237'culo'
          end
          object LTransportCategory: TLFLabel
            Left = 81
            Top = 184
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cat. Transporte'
          end
          object LDangerNumber: TLFLabel
            Left = 91
            Top = 163
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ident. Riesgo'
          end
          object LConsidEspEmbalado: TLFLabel
            Left = 45
            Top = 274
            Width = 109
            Height = 13
            Alignment = taRightJustify
            Caption = 'Consid. Esp. Embalado'
          end
          object LCriterioSeleccion: TLFLabel
            Left = 86
            Top = 441
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Crit. Selecci'#243'n'
          end
          object LApartado: TLFLabel
            Left = 607
            Top = 441
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Apartado'
          end
          object LLetra: TLFLabel
            Left = 626
            Top = 463
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Letra'
          end
          object LNaturalezaPeligro: TLFLabel
            Left = 51
            Top = 464
            Width = 103
            Height = 13
            Alignment = taRightJustify
            Caption = 'Naturaleza del Peligro'
          end
          object LMedidasProteccion: TLFLabel
            Left = 45
            Top = 486
            Width = 109
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medidas de Protecci'#243'n'
          end
          object LClasification: TLFLabel
            Left = 95
            Top = 95
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clasificacion'
          end
          object LTunelCode: TLFLabel
            Left = 91
            Top = 205
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo Tunel'
          end
          object LExceptedQuantity: TLFLabel
            Left = 504
            Top = 205
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cant. Limitadas'
          end
          object LPackingInstructions: TLFLabel
            Left = 45
            Top = 254
            Width = 109
            Height = 13
            Alignment = taRightJustify
            Caption = 'Instrucciones Embalaje'
          end
          object LConsidEspEmbaladoComun: TLFLabel
            Left = 9
            Top = 296
            Width = 145
            Height = 13
            Alignment = taRightJustify
            Caption = 'Consid. Esp. Embalado Comun'
          end
          object LPortableTankInstructions: TLFLabel
            Left = 36
            Top = 344
            Width = 117
            Height = 13
            Alignment = taRightJustify
            Caption = 'Instrucciones Transporte'
          end
          object LPortableTankSpecialProvisions: TLFLabel
            Left = 36
            Top = 366
            Width = 117
            Height = 13
            Hint = 'Disposiciones Especiales de Embalaje'
            Alignment = taRightJustify
            Caption = 'Disp. Esp. de Transporte'
            ParentShowHint = False
            ShowHint = True
          end
          object LADRTankSpecialProvisions: TLFLabel
            Left = 50
            Top = 411
            Width = 103
            Height = 13
            Hint = 'Disposiciones Especiales de Embalaje'
            Alignment = taRightJustify
            Caption = 'Disp. Esp. de Tanque'
            ParentShowHint = False
            ShowHint = True
          end
          object LBulkSpecialProvisions: TLFLabel
            Left = 435
            Top = 252
            Width = 141
            Height = 13
            Alignment = taRightJustify
            Caption = 'Consid. Esp. Trasporte Granel'
          end
          object LPackagesSpecialProvisions: TLFLabel
            Left = 437
            Top = 232
            Width = 139
            Height = 13
            Alignment = taRightJustify
            Caption = 'Consid. Esp. Trasporte Bultos'
          end
          object LLoadingSpecialProvisions: TLFLabel
            Left = 387
            Top = 274
            Width = 189
            Height = 13
            Alignment = taRightJustify
            Caption = 'Consid. Esp. Trasporte Carga/Descarga'
          end
          object LOperationSpecialProvisions: TLFLabel
            Left = 459
            Top = 296
            Width = 117
            Height = 13
            Alignment = taRightJustify
            Caption = 'Consid. Esp. Explotacion'
          end
          object DBECodigo: TLFDbedit
            Left = 160
            Top = 4
            Width = 92
            Height = 21
            Color = clInfoBk
            DataField = 'ID'
            DataSource = DMADRTipos.DSQMADRTipos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEName: TLFDbedit
            Left = 160
            Top = 48
            Width = 641
            Height = 21
            DataField = 'NAME'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 2
          end
          object DBCBActivo: TLFDBCheckBox
            Left = 257
            Top = 7
            Width = 70
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 30
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMADRTipos.DSQMADRTipos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBELabels: TLFDbedit
            Left = 160
            Top = 136
            Width = 220
            Height = 21
            DataField = 'LABELS'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 6
          end
          object DBESpecialProvisions: TLFDbedit
            Left = 160
            Top = 228
            Width = 220
            Height = 21
            DataField = 'SPECIAL_PROVISIONS'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 10
          end
          object DBELimitedQuantity: TLFDbedit
            Left = 582
            Top = 180
            Width = 92
            Height = 21
            DataField = 'LIMITED_QUANTITY'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 22
          end
          object DBEADRTankCode: TLFDbedit
            Left = 160
            Top = 385
            Width = 92
            Height = 21
            DataField = 'ADR_TANK_CODE'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 17
          end
          object DBEVehicle: TLFDbedit
            Left = 160
            Top = 319
            Width = 92
            Height = 21
            DataField = 'VEHICLE'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 14
          end
          object DBEConsidEspEmbalado: TLFDbedit
            Left = 160
            Top = 272
            Width = 220
            Height = 21
            DataField = 'SPECIAL_PACKING_PROVISIONS'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 12
          end
          object DBEDangerNumber: TLFDbedit
            Left = 160
            Top = 158
            Width = 92
            Height = 21
            DataField = 'DANGER_NUMBER'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 7
          end
          object DBCBVTransportCategory: TDBComboBoxValue
            Left = 160
            Top = 180
            Width = 220
            Height = 21
            Style = csDropDownList
            DataField = 'TRANSPORT_CATEGORY'
            DataSource = DMADRTipos.DSQMADRTipos
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
            TabOrder = 8
          end
          object DBECriterioSeleccion: TLFDbedit
            Left = 160
            Top = 438
            Width = 437
            Height = 21
            DataField = 'CRITERIO_SELECCION'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 19
          end
          object DBEApartado: TLFDbedit
            Left = 654
            Top = 438
            Width = 92
            Height = 21
            DataField = 'APARTADO'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 28
          end
          object DBELetra: TLFDbedit
            Left = 654
            Top = 460
            Width = 92
            Height = 21
            DataField = 'LETRA'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 29
          end
          object DBEFNaturPeligro: TLFDBEditFind2000
            Left = 160
            Top = 460
            Width = 58
            Height = 21
            DataField = 'COD_NATURALEZA_PELIGRO'
            DataSource = DMADRTipos.DSQMADRTipos
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
            Left = 160
            Top = 482
            Width = 58
            Height = 21
            DataField = 'COD_MEDIDAS_PROTECCION'
            DataSource = DMADRTipos.DSQMADRTipos
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
            Left = 219
            Top = 460
            Width = 378
            Height = 21
            Color = clInfoBk
            DataSource = DMADRTipos.DSQMADRTipos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 31
            Tabla_a_buscar = 'SYS_QUI_NATURALEZA_PELIGRO'
            Campo_Descripcion = 'DESCRIPCION_CORTA'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'COD_NATURALEZA_PELIGRO')
            CamposWhereTabla.Strings = (
              'COD_NATURALEZA_PELIGRO')
          end
          object DescMedidasProtec: TLFHYDBDescription
            Left = 219
            Top = 482
            Width = 378
            Height = 21
            Color = clInfoBk
            DataSource = DMADRTipos.DSQMADRTipos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 32
            Tabla_a_buscar = 'SYS_QUI_MEDIDAS_PROTECCION'
            Campo_Descripcion = 'DESCRIPCION_CORTA'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'COD_MEDIDAS_PROTECCION')
            CamposWhereTabla.Strings = (
              'COD_MEDIDAS_PROTECCION')
          end
          object DBEClasification: TLFDbedit
            Left = 160
            Top = 92
            Width = 92
            Height = 21
            DataField = 'CLASIFICATION'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 4
          end
          object DBETunelCode: TLFDbedit
            Left = 160
            Top = 202
            Width = 92
            Height = 21
            DataField = 'TUNEL_CODE'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 9
          end
          object DBEExceptedQuantity: TLFDbedit
            Left = 582
            Top = 202
            Width = 92
            Height = 21
            DataField = 'EXCEPTED_QUANTITY'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 23
          end
          object DBEPackingInstructions: TLFDbedit
            Left = 160
            Top = 250
            Width = 220
            Height = 21
            DataField = 'PACKING_INSTRUCTIONS'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 11
          end
          object DBEDBEConsidEspEmbaladoComun: TLFDbedit
            Left = 160
            Top = 294
            Width = 220
            Height = 21
            DataField = 'MIXED_PACKING_PROVISIONS'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 13
          end
          object DBEPortableTankInstructions: TLFDbedit
            Left = 160
            Top = 341
            Width = 220
            Height = 21
            DataField = 'PORTABLE_TANK_INSTRUCTIONS'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 15
          end
          object DBEPortableTankSpecialProvisions: TLFDbedit
            Left = 160
            Top = 363
            Width = 220
            Height = 21
            DataField = 'PORTABLE_TANK_SPECIAL_PROV'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 16
          end
          object DBEADRTankSpecialProvisions: TLFDbedit
            Left = 160
            Top = 407
            Width = 220
            Height = 21
            DataField = 'ADR_TANK_SPECIAL_PROV'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 18
          end
          object DBEFUNNumber: TLFDBEditFind2000
            Left = 160
            Top = 26
            Width = 92
            Height = 21
            CharCase = ecUpperCase
            DataField = 'UN_NUMBER'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ADR_NUMBERS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'UN_NUMBER'
            CampoStr = 'NAME'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'UN_NUMBER')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFADRClass: TLFDBEditFind2000
            Left = 160
            Top = 70
            Width = 92
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CLASS'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 3
            OnChange = DBEFADRClassChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ADR_CLASES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLASS'
            CampoStr = 'NAME'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CLASS')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFADRPackingGroup: TLFDBEditFind2000
            Left = 160
            Top = 114
            Width = 92
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PACKING_GROUP'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 5
            OnChange = DBEFADRPackingGroupChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ADR_PACKING_GROUPS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PACKING_GROUP'
            CampoStr = 'NAME'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PACKING_GROUP')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEBulkSpecialProvisions: TLFDbedit
            Left = 582
            Top = 250
            Width = 220
            Height = 21
            DataField = 'BULK_SPECIAL_PROV'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 25
          end
          object DBEPackagesSpecialProvisions: TLFDbedit
            Left = 582
            Top = 228
            Width = 220
            Height = 21
            DataField = 'PACKAGES_SPECIAL_PROV'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 24
          end
          object DBELoadingSpecialProvisions: TLFDbedit
            Left = 582
            Top = 272
            Width = 220
            Height = 21
            DataField = 'LOADING_SPECIAL_PROV'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 26
          end
          object DBEOperationSpecialProvisions: TLFDbedit
            Left = 582
            Top = 294
            Width = 220
            Height = 21
            DataField = 'OPERATION_SPECIAL_PROV'
            DataSource = DMADRTipos.DSQMADRTipos
            TabOrder = 27
          end
          object ENameADRClass: TLFEdit
            Left = 253
            Top = 70
            Width = 548
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 33
          end
          object ENameADRPackingGroup: TLFEdit
            Left = 253
            Top = 114
            Width = 548
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 34
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 814
          Height = 517
          DataSource = DMADRTipos.DSQMADRTipos
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'ADR_TANK_CODE'
            'ADR_TANK_SPECIAL_PROV'
            'APARTADO'
            'BULK_SPECIAL_PROV'
            'CLASIFICATION'
            'CLASS'
            'COD_MEDIDAS_PROTECCION'
            'COD_NATURALEZA_PELIGRO'
            'CRITERIO_SELECCION'
            'DANGER_NUMBER'
            'EXCEPTED_QUANTITY'
            'ID'
            'IDENTIFICACION_RIESGOS'
            'LABELS'
            'LETRA'
            'LIMITED_QUANTITY'
            'LOADING_SPECIAL_PROV'
            'MIXED_PACKING_PROVISIONS'
            'NAME'
            'OPERATION_SPECIAL_PROV'
            'PACKAGES_SPECIAL_PROV'
            'PACKING_GROUP'
            'PACKING_INSTRUCTIONS'
            'PORTABLE_TANK_INSTRUCTIONS'
            'PORTABLE_TANK_SPECIAL_PROV'
            'SPECIAL_PACKING_PROVISIONS'
            'SPECIAL_PROVISIONS'
            'TRANSPORT_CATEGORY'
            'TUNEL_CODE'
            'UN_NUMBER'
            'VEHICLE')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UN_NUMBER'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Width = 259
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLASS'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLASIFICATION'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PACKING_GROUP'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LABELS'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DANGER_NUMBER'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSPORT_CATEGORY'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TUNEL_CODE'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPECIAL_PROVISIONS'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIMITED_QUANTITY'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EXCEPTED_QUANTITY'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PACKING_INSTRUCTIONS'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPECIAL_PACKING_PROVISIONS'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MIXED_PACKING_PROVISIONS'
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORTABLE_TANK_INSTRUCTIONS'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORTABLE_TANK_SPECIAL_PROV'
              Width = 144
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ADR_TANK_CODE'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ADR_TANK_SPECIAL_PROV'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VEHICLE'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PACKAGES_SPECIAL_PROV'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BULK_SPECIAL_PROV'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOADING_SPECIAL_PROV'
              Width = 139
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERATION_SPECIAL_PROV'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CRITERIO_SELECCION'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDENTIFICACION_RIESGOS'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APARTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LETRA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_NATURALEZA_PELIGRO'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_MEDIDAS_PROTECCION'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 575
    Width = 826
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
  inherited ALMain: TLFActionList
    Left = 400
    Top = 24
  end
  inherited FSMain: TLFFibFormStorage
    Left = 362
    Top = 14
  end
end
