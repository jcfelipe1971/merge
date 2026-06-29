inherited FPregModelo347: TFPregModelo347
  Left = 299
  Top = 285
  Width = 1433
  Height = 447
  BiDiMode = bdRightToLeft
  BorderStyle = bsSizeable
  Caption = 'Listado del Modelo 347'
  OldCreateOrder = True
  ParentBiDiMode = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1425
    Height = 420
    inherited TBMain: TLFToolBar
      Width = 1425
      ButtonWidth = 89
      inherited TButtImprimir: TToolButton
        Left = 89
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 178
      end
      inherited TButtSalir: TToolButton
        Left = 267
      end
      object TButtConfigurar: TToolButton
        Left = 356
        Top = 0
        Action = AConfigurar
      end
      object TButtExportar: TToolButton
        Left = 445
        Top = 0
        Action = AExportarMod347
      end
      object TButtCarta: TToolButton
        Left = 534
        Top = 0
        Action = AImprimirCarta
      end
      object TBEnviarCorreo: TToolButton
        Left = 623
        Top = 0
        Action = AEnviarCorreo
      end
      object TBConfigurarCorreo: TToolButton
        Left = 712
        Top = 0
        Action = AConfigurarCorreo
      end
    end
    inherited PBListado: TProgressBar
      Top = 404
      Width = 1425
      TabOrder = 2
    end
    object PNLImportesDeclarar: TLFPanel
      Left = 0
      Top = 36
      Width = 1425
      Height = 368
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object TBImportesDeclarar: TLFToolBar
        Left = 0
        Top = 0
        Width = 1425
        Height = 25
        AutoSize = True
        ButtonHeight = 23
        Caption = 'TBImportesDeclarar'
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 1
        Separators = True
        object NavImportesDeclarar: THYMNavigator
          Left = 0
          Top = 2
          Width = 240
          Height = 23
          DataSource = DMRMayoresCantidad.DSImportesDeclarar
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
          Left = 240
          Top = 2
          Width = 8
          Caption = 'TBSep1'
          Style = tbsSeparator
        end
        object TButtTodos: TToolButton
          Left = 248
          Top = 2
          Hint = 'Marcar todos los pedidos pendientes'
          Caption = 'Todos'
          ImageIndex = 146
          OnClick = TButtTodosClick
        end
        object TButtDesmarcar: TToolButton
          Left = 271
          Top = 2
          Hint = 'Desmarcar todos los pedidos pendientes'
          Caption = 'Desmarcar'
          ImageIndex = 147
          OnClick = TButtDesmarcarClick
        end
        object TBSep2: TToolButton
          Left = 294
          Top = 2
          Width = 8
          Caption = 'TBSep2'
          ImageIndex = 0
          Style = tbsSeparator
        end
        object PNLEjercicio: TLFPanel
          Left = 302
          Top = 2
          Width = 217
          Height = 23
          BevelOuter = bvNone
          TabOrder = 1
          object LEjercicio: TLFLabel
            Left = 34
            Top = 4
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
          end
          object CBEjercicio: TLFComboBox
            Left = 81
            Top = 0
            Width = 135
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = CBOrdenChange
          end
        end
        object PNLOrden: TLFPanel
          Left = 519
          Top = 2
          Width = 217
          Height = 23
          BevelOuter = bvNone
          TabOrder = 2
          object LOrdenListado: TLFLabel
            Left = 12
            Top = 4
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden listado'
          end
          object CBOrden: TLFComboBox
            Left = 81
            Top = 0
            Width = 135
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 0
            Text = 'CIF'
            OnChange = CBOrdenChange
            Items.Strings = (
              'CIF'
              'Nombres'
              'Importes'
              'Cuenta')
          end
        end
        object PNLFiltroTipo: TLFPanel
          Left = 736
          Top = 2
          Width = 176
          Height = 23
          BevelOuter = bvNone
          TabOrder = 3
          object LTipo: TLFLabel
            Left = 13
            Top = 4
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object CBTipo: TLFComboBox
            Left = 41
            Top = 0
            Width = 135
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = CBOrdenChange
            Items.Strings = (
              'Compras'
              'Ventas'
              'Ambos')
          end
        end
        object PNLFiltroImpresos: TLFPanel
          Left = 912
          Top = 2
          Width = 176
          Height = 23
          BevelOuter = bvNone
          TabOrder = 4
          object LImpresos: TLFLabel
            Left = 0
            Top = 4
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Impreso'
          end
          object CBImpresos: TLFComboBox
            Left = 41
            Top = 0
            Width = 135
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 0
            Text = 'Todos'
            OnChange = CBOrdenChange
            Items.Strings = (
              'Todos'
              'Impresos'
              'Pendientes')
          end
        end
      end
      object DBGImportesDelcarar: TDBGridFind2000
        Left = 0
        Top = 25
        Width = 1425
        Height = 311
        Align = alClient
        DataSource = DMRMayoresCantidad.DSImportesDeclarar
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGImportesDelcararDrawColumnCell
        OnDblClick = DBGImportesDelcararDblClick
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoCambiarColumna = False
        AutoPostEnCheckBox = True
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        Transaction = DMRMayoresCantidad.TLocal
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'IMPORTE_T1'
          'IMPORTE_T1_PRESENTAR'
          'IMPORTE_T2'
          'IMPORTE_T2_PRESENTAR'
          'IMPORTE_T3'
          'IMPORTE_T3_PRESENTAR'
          'IMPORTE_T4'
          'IMPORTE_T4_PRESENTAR'
          'IMPORTE_TOTAL'
          'IMPORTE_TOTAL_PRESENTAR'
          'MODIFICADO'
          'NIF'
          'NOMBRE_R_SOCIAL'
          'SIGNO')
        ColumnasCheckBoxes.Strings = (
          'MODIFICADO'
          'INVERSION_SUJETO_PASIVO'
          'CORREO_ENVIADO'
          'ENTRADA_AGRUPACION')
        ColumnasChecked.Strings = (
          '1'
          '1'
          '1'
          '1')
        ColumnasNoChecked.Strings = (
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
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'CORREO_ENVIADO'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENTRADA_AGRUPACION'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NIF'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIGNO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IMPORTE_T1'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IMPORTE_T2'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IMPORTE_T3'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IMPORTE_T4'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IMPORTE_TOTAL'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INVERSION_SUJETO_PASIVO'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE_T1_PRESENTAR'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE_T2_PRESENTAR'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE_T3_PRESENTAR'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE_T4_PRESENTAR'
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IMPORTE_TOTAL_PRESENTAR'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODIFICADO'
            Width = 55
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TERCERO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_POSTAL'
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIR_COMPLETA_N'
            ReadOnly = True
            Width = 250
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LOCALIDAD'
            ReadOnly = True
            Width = 120
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'EMAIL'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TELEFONO01'
            ReadOnly = True
            Width = 120
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TELEFONO02'
            ReadOnly = True
            Width = 120
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TELEFAX'
            ReadOnly = True
            Width = 120
            Visible = True
          end>
      end
      object PNLCarta: TLFPanel
        Left = 0
        Top = 336
        Width = 1425
        Height = 32
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object LblFecha: TLFLabel
          Left = 31
          Top = 10
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Listado'
        end
        object LBLLugar: TLFLabel
          Left = 217
          Top = 10
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lugar'
        end
        object DTPFecha: TLFDateEdit
          Left = 104
          Top = 7
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object ELugar: TLFEdit
          Left = 251
          Top = 7
          Width = 294
          Height = 21
          TabOrder = 1
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 1124
    Top = 46
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AExportarMod347: TAction
      Caption = 'Exportar'
      Hint = 'Exportar Modelo 347'
      ImageIndex = 36
      OnExecute = AExportarMod347Execute
    end
    object AImprimirCarta: TAction
      Caption = 'Imprimir carta'
      Hint = 'Imprimir carta para los registro seleccionados'
      ImageIndex = 14
      OnExecute = AImprimirCartaExecute
    end
    object AEnviarCorreo: TAction
      Caption = 'Enviar Correo'
      Hint = 'Enviar correo a los registros seleccionados'
      ImageIndex = 34
      OnExecute = AEnviarCorreoExecute
    end
    object AConfigurarCorreo: TAction
      Caption = 'Configurar Correo'
      Hint = 'Configuraci'#243'n de listado'
      ImageIndex = 77
      OnExecute = AConfigurarCorreoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 1092
    Top = 40
  end
end
