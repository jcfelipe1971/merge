inherited FMRegistroFitosanitario: TFMRegistroFitosanitario
  Left = 746
  Top = 274
  Width = 795
  Height = 400
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Registro Fitosanitario'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 795
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 785
    Height = 347
    inherited TBMain: TLFToolBar
      Width = 781
      inherited NavMain: THYMNavigator
        DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 44
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
      end
      inherited TbuttComp: TToolButton
        Left = 280
      end
    end
    inherited PCMain: TLFPageControl
      Width = 781
      Height = 317
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 773
          Height = 289
          inherited G2KTableLoc: TG2KTBLoc
            Left = 13
            Top = 3
          end
          object LId: TLFLabel
            Left = 72
            Top = 4
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object LEjercicio: TLFLabel
            Left = 627
            Top = 4
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
          end
          object LCanal: TLFLabel
            Left = 640
            Top = 26
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LTipo: TLFLabel
            Left = 646
            Top = 70
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LSerie: TLFLabel
            Left = 643
            Top = 48
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LRIG: TLFLabel
            Left = 648
            Top = 92
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'RIG'
          end
          object LLinea: TLFLabel
            Left = 641
            Top = 114
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'L'#237'nea'
          end
          object LTipoRegistroFitosanitario: TLFLabel
            Left = 10
            Top = 26
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de registro'
          end
          object LFecha: TLFLabel
            Left = 444
            Top = 4
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LArticulo: TLFLabel
            Left = 46
            Top = 48
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
            Layout = tlCenter
          end
          object LTitulo: TLFLabel
            Left = 224
            Top = 48
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LLote: TLFLabel
            Left = 62
            Top = 70
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote'
          end
          object LCantidad: TLFLabel
            Left = 210
            Top = 70
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cantidad'
          end
          object LNIF: TLFLabel
            Left = 66
            Top = 114
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'NIF'
          end
          object LNombre: TLFLabel
            Left = 46
            Top = 136
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LDireccion: TLFLabel
            Left = 38
            Top = 158
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object LCodigoRegistro: TLFLabel
            Left = 204
            Top = 26
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Reg.'
          end
          object LCodPostal: TLFLabel
            Left = 29
            Top = 180
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Postal'
          end
          object LLocalidad: TLFLabel
            Left = 188
            Top = 180
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Localidad'
          end
          object LCarnetAplicador: TLFLabel
            Left = 5
            Top = 92
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Carnet Aplicador'
          end
          object LNotas: TLFLabel
            Left = 55
            Top = 202
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LFechaValidezCarnet: TLFLabel
            Left = 383
            Top = 92
            Width = 92
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Validez Carnet'
          end
          object DBEID: TLFDbedit
            Left = 88
            Top = 0
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'ID_REGISTRO_FITOSANITARIO'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            Enabled = False
            TabOrder = 0
          end
          object DBEjercicio: TLFDbedit
            Left = 672
            Top = 0
            Width = 80
            Height = 21
            Color = clInfoBk
            DataField = 'EJERCICIO'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            Enabled = False
            TabOrder = 1
          end
          object DBEFCanal: TLFDBEditFind2000
            Left = 672
            Top = 22
            Width = 80
            Height = 21
            Color = clInfoBk
            DataField = 'CANAL'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            AutoCambiarFoco = True
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'canal'
            CampoStr = 'titulo'
            CampoADevolver = 'canal'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBTipo: TLFDbedit
            Left = 672
            Top = 66
            Width = 80
            Height = 21
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            Enabled = False
            TabOrder = 4
          end
          object DBSerie: TLFDbedit
            Left = 672
            Top = 44
            Width = 80
            Height = 21
            Color = clInfoBk
            DataField = 'SERIE'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            Enabled = False
            TabOrder = 3
          end
          object DBRig: TLFDbedit
            Left = 672
            Top = 88
            Width = 80
            Height = 21
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            Enabled = False
            TabOrder = 5
          end
          object DBLinea: TLFDbedit
            Left = 673
            Top = 110
            Width = 80
            Height = 21
            Color = clInfoBk
            DataField = 'LINEA'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            Enabled = False
            TabOrder = 6
          end
          object DBCBTipoRegistro: TLFDBComboBoxValue
            Left = 88
            Top = 22
            Width = 112
            Height = 21
            Hint = 'Tipo de registro fitosanitario'
            DataField = 'TIPO_REGISTRO'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            ItemHeight = 13
            Items.Strings = (
              'Aves'
              'Fitosanitario'
              'Prec. Explosivos')
            Values.Strings = (
              'A'
              'F'
              'E')
            TabOrder = 8
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 479
            Top = 0
            Width = 95
            Height = 21
            DataField = 'FECHA'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 7
          end
          object DBEFArticulo: TLFFibDBEditFind
            Left = 88
            Top = 44
            Width = 112
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            TabOrder = 10
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ARTICULO')
          end
          object DBDescripcion: TLFDbedit
            Left = 256
            Top = 44
            Width = 318
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            TabOrder = 11
          end
          object DBELote: TLFDbedit
            Left = 88
            Top = 66
            Width = 112
            Height = 21
            DataField = 'LOTE'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            TabOrder = 12
          end
          object DBCantidad: TLFDbedit
            Left = 256
            Top = 66
            Width = 112
            Height = 21
            DataField = 'CANTIDAD'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            TabOrder = 13
          end
          object DBENIF: TLFDbedit
            Left = 88
            Top = 110
            Width = 112
            Height = 21
            DataField = 'NIF'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            TabOrder = 16
          end
          object DBENombre: TLFDbedit
            Left = 88
            Top = 132
            Width = 486
            Height = 21
            DataField = 'NOMBRE'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            TabOrder = 17
          end
          object DBEDireccion: TLFDbedit
            Left = 88
            Top = 154
            Width = 486
            Height = 21
            DataField = 'DIRECCION'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            TabOrder = 18
          end
          object DBECOD_REG_FITOSANITARIO: TLFDbedit
            Left = 256
            Top = 22
            Width = 318
            Height = 21
            DataField = 'COD_REG_FITOSANITARIO'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            TabOrder = 9
          end
          object DBECodigoPostal: TLFDbedit
            Left = 88
            Top = 176
            Width = 95
            Height = 21
            DataField = 'C_POSTAL'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            TabOrder = 19
          end
          object DBELocalidad: TLFDbedit
            Left = 238
            Top = 176
            Width = 336
            Height = 21
            DataField = 'LOCALIDAD'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            TabOrder = 20
          end
          object DBECarnetAplicador: TLFDbedit
            Left = 88
            Top = 88
            Width = 209
            Height = 21
            DataField = 'CARNET_APLICADOR'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            TabOrder = 14
            OnChange = DBECarnetAplicadorChange
          end
          object DBMNotas: TLFDBMemo
            Left = 88
            Top = 198
            Width = 486
            Height = 77
            DataField = 'NOTAS'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 21
          end
          object DBDTPFechaValidezCarnet: TLFDBDateEdit
            Left = 479
            Top = 88
            Width = 95
            Height = 21
            DataField = 'FECHA_VALIDEZ_CARNET_APLICADOR'
            DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 15
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 773
          Height = 289
          DataSource = DMRegistroFitosanitario.DSQMRegistroFitosanitario
          Columns = <
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_REGISTRO'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NIF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIRECCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'C_POSTAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOCALIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 244
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 347
    Width = 785
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
