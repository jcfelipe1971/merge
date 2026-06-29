inherited ZFMMarcajeManual: TZFMMarcajeManual
  Left = 218
  Top = 105
  Width = 1058
  Height = 600
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Marcajes Manuales'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1048
    Height = 289
    inherited TBMain: TLFToolBar
      Width = 1044
      inherited NavMain: THYMNavigator
        Width = 176
        DataSource = ZDMMarcajeManual.DSMMarcajes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBDECorte
      end
      inherited TSepNav: TToolButton
        Left = 176
      end
      inherited EPMain: THYMEditPanel
        Left = 184
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 244
      end
      inherited TbuttComp: TToolButton
        Left = 252
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1044
      Height = 259
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 1036
          Height = 231
          inherited G2KTableLoc: TG2KTBLoc
            Left = 116
            Top = 57
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_VER_MARCAJES_MANUALES'
            CampoNum = 'RIG'
            CampoStr = 'SU_REFERENCIA'
            Filtros = [obEmpresa, obEjercicio, obCanal, obSerie]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LPedido: TLFLabel
            Left = 31
            Top = 39
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido'
          end
          object LSuReferencia: TLFLabel
            Left = 136
            Top = 40
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Su Referencia'
          end
          object LCliente: TLFLabel
            Left = 32
            Top = 18
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LFechaCorte: TLFLabel
            Left = 39
            Top = 69
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Corte'
          end
          object LOperarioCorte: TLFLabel
            Left = 250
            Top = 69
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object LUnion: TLFLabel
            Left = 36
            Top = 91
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uni'#243'n'
          end
          object LOperarioUnion: TLFLabel
            Left = 250
            Top = 91
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object LMacarron: TLFLabel
            Left = 19
            Top = 113
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Macarr'#243'n'
          end
          object LOperarioMacarron: TLFLabel
            Left = 250
            Top = 113
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object LMontaje: TLFLabel
            Left = 26
            Top = 157
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Montaje'
          end
          object LOperarioMontaje: TLFLabel
            Left = 250
            Top = 157
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object LTerminado: TLFLabel
            Left = 14
            Top = 201
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Terminado'
          end
          object LOperarioTerminado: TLFLabel
            Left = 250
            Top = 201
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object LPreparado: TLFLabel
            Left = 15
            Top = 179
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Preparado'
          end
          object LOperarioPreparado: TLFLabel
            Left = 250
            Top = 179
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object LCodigoBarra: TLFLabel
            Left = 387
            Top = 39
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo de barras'
          end
          object LMotor: TLFLabel
            Left = 37
            Top = 134
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motor'
          end
          object LOperarioMotor: TLFLabel
            Left = 250
            Top = 134
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object DBEPedido: TLFDbedit
            Left = 68
            Top = 37
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
          end
          object DBESuReferencia: TLFDbedit
            Left = 208
            Top = 37
            Width = 172
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SU_REFERENCIA'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
          end
          object DBECliente: TLFDbedit
            Left = 68
            Top = 15
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CLIENTE'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
          end
          object DBEDescCliente: TLFDbedit
            Left = 134
            Top = 15
            Width = 403
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESC_CLIENTE'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
          end
          object DBDECorte: TLFDBDateEdit
            Left = 68
            Top = 65
            Width = 101
            Height = 21
            DataField = 'FECHA_CORTE'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DBEFCorte: TLFDBEditFind2000
            Left = 295
            Top = 65
            Width = 41
            Height = 21
            DataField = 'OPERARIO_CORTE'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            TabOrder = 2
            OnChange = DBEFCorteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescOpeCorte: TLFHYDBDescription
            Left = 337
            Top = 65
            Width = 200
            Height = 21
            Color = clInfoBk
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 25
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'OPERARIO_CORTE')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'EMPLEADO')
          end
          object DBDEUnion: TLFDBDateEdit
            Left = 68
            Top = 87
            Width = 101
            Height = 21
            DataField = 'FECHA_UNION'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBEFUnion: TLFDBEditFind2000
            Left = 295
            Top = 87
            Width = 41
            Height = 21
            DataField = 'OPERARIO_UNION'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            TabOrder = 5
            OnChange = DBEFUnionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'BAJA=0'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescOpeUnion: TLFHYDBDescription
            Left = 337
            Top = 87
            Width = 200
            Height = 21
            Color = clInfoBk
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 26
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'OPERARIO_UNION')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'EMPLEADO')
          end
          object DBDEMacarron: TLFDBDateEdit
            Left = 68
            Top = 109
            Width = 101
            Height = 21
            DataField = 'FECHA_MACARRON'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 6
          end
          object DBEFMacarron: TLFDBEditFind2000
            Left = 295
            Top = 109
            Width = 41
            Height = 21
            DataField = 'OPERARIO_MACARRON'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            TabOrder = 8
            OnChange = DBEFMacarronChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'BAJA=0'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescOpeMacarron: TLFHYDBDescription
            Left = 337
            Top = 109
            Width = 200
            Height = 21
            Color = clInfoBk
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 27
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'OPERARIO_MACARRON')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'EMPLEADO')
          end
          object DBDEMontaje: TLFDBDateEdit
            Left = 68
            Top = 153
            Width = 101
            Height = 21
            DataField = 'FECHA_MONTAJE'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 12
          end
          object DBEFMontaje: TLFDBEditFind2000
            Left = 295
            Top = 153
            Width = 41
            Height = 21
            DataField = 'OPERARIO_MONTAJE'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            TabOrder = 14
            OnChange = DBEFMontajeChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'BAJA=0'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescOpeMontaje: TLFHYDBDescription
            Left = 337
            Top = 153
            Width = 200
            Height = 21
            Color = clInfoBk
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 28
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'OPERARIO_MONTAJE')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'EMPLEADO')
          end
          object DBDETerminado: TLFDBDateEdit
            Left = 68
            Top = 197
            Width = 101
            Height = 21
            DataField = 'FECHA_TERMINADO'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 18
          end
          object DBEFTerminado: TLFDBEditFind2000
            Left = 295
            Top = 197
            Width = 41
            Height = 21
            DataField = 'OPERARIO_TERMINADO'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            TabOrder = 20
            OnChange = DBEFTerminadoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'BAJA=0'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescOpeTerminado: TLFHYDBDescription
            Left = 337
            Top = 197
            Width = 200
            Height = 21
            Color = clInfoBk
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 29
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'OPERARIO_TERMINADO')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'EMPLEADO')
          end
          object DBDTCorte: TDBDateTimePicker
            Left = 170
            Top = 65
            Width = 70
            Height = 21
            CalAlignment = dtaLeft
            Date = 43595
            Time = 43595
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 1
            DataField = 'FECHA_CORTE'
            DataSource = ZDMMarcajeManual.DSMMarcajes
          end
          object DBDTUnion: TDBDateTimePicker
            Left = 170
            Top = 87
            Width = 70
            Height = 21
            CalAlignment = dtaLeft
            Date = 43595
            Time = 43595
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 4
            DataField = 'FECHA_UNION'
            DataSource = ZDMMarcajeManual.DSMMarcajes
          end
          object DBDTMacarron: TDBDateTimePicker
            Left = 170
            Top = 109
            Width = 70
            Height = 21
            CalAlignment = dtaLeft
            Date = 43595
            Time = 43595
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 7
            DataField = 'FECHA_MACARRON'
            DataSource = ZDMMarcajeManual.DSMMarcajes
          end
          object DBDTMontaje: TDBDateTimePicker
            Left = 170
            Top = 153
            Width = 70
            Height = 21
            CalAlignment = dtaLeft
            Date = 43595
            Time = 43595
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 13
            DataField = 'FECHA_MONTAJE'
            DataSource = ZDMMarcajeManual.DSMMarcajes
          end
          object DBDTTerminado: TDBDateTimePicker
            Left = 170
            Top = 197
            Width = 70
            Height = 21
            CalAlignment = dtaLeft
            Date = 43595
            Time = 43595
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 19
            DataField = 'FECHA_TERMINADO'
            DataSource = ZDMMarcajeManual.DSMMarcajes
          end
          object DBDTPreparado: TDBDateTimePicker
            Left = 170
            Top = 175
            Width = 70
            Height = 21
            CalAlignment = dtaLeft
            Date = 43595
            Time = 43595
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 16
            DataField = 'FECHA_PREPARADO'
            DataSource = ZDMMarcajeManual.DSMMarcajes
          end
          object DBDEPreparado: TLFDBDateEdit
            Left = 68
            Top = 175
            Width = 101
            Height = 21
            DataField = 'FECHA_PREPARADO'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 15
          end
          object DBEFPreparado: TLFDBEditFind2000
            Left = 295
            Top = 175
            Width = 41
            Height = 21
            DataField = 'OPERARIO_PREPARADO'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            TabOrder = 17
            OnChange = DBEFPreparadoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'BAJA=0'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescOpePreparado: TLFHYDBDescription
            Left = 337
            Top = 175
            Width = 200
            Height = 21
            Color = clInfoBk
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 30
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'OPERARIO_PREPARADO')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'EMPLEADO')
          end
          object DBECodBarr: TLFDbedit
            Left = 472
            Top = 37
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'COD_BARRAS'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 31
          end
          object DBMotor: TLFDBDateEdit
            Left = 68
            Top = 131
            Width = 101
            Height = 21
            DataField = 'FECHA_MOTOR'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 9
          end
          object DBTMotor: TDBDateTimePicker
            Left = 170
            Top = 131
            Width = 70
            Height = 21
            CalAlignment = dtaLeft
            Date = 43595
            Time = 43595
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 10
            DataField = 'FECHA_MOTOR'
            DataSource = ZDMMarcajeManual.DSMMarcajes
          end
          object DescOpeMotor: TLFHYDBDescription
            Left = 337
            Top = 131
            Width = 200
            Height = 21
            Color = clInfoBk
            DataSource = ZDMMarcajeManual.DSMMarcajes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 32
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'OPERARIO_MOTOR')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'EMPLEADO')
          end
          object DBEFMotor: TLFDBEditFind2000
            Left = 295
            Top = 131
            Width = 41
            Height = 21
            DataField = 'OPERARIO_MOTOR'
            DataSource = ZDMMarcajeManual.DSMMarcajes
            TabOrder = 11
            OnChange = DBEFMotorChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'BAJA=0'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1036
          Height = 231
          DataSource = ZDMMarcajeManual.DSMMarcajes
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_CLIENTE'
              Width = 206
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              Width = 193
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CORTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERARIO_CORTE'
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_UNION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERARIO_UNION'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_MACARRON'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERARIO_MACARRON'
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_MOTOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERARIO_MOTOR'
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_MONTAJE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERARIO_MONTAJE'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_TERMINADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERARIO_TERMINADO'
              Width = 131
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar [1]
    Top = 547
    Width = 1048
  end
  inherited PDetalle: TLFPanel [2]
    Top = 289
    Width = 1048
    Height = 258
    inherited TBDetalle: TLFToolBar
      Width = 1048
      TabOrder = 1
      inherited NavDetalle: THYMNavigator
        Width = 100
        DataSource = ZDMMarcajeManual.DSDetMarcajes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        Exclusivo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 1048
      Height = 236
      DataSource = ZDMMarcajeManual.DSDetMarcajes
      TabOrder = 0
      ColumnaInicial = 3
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA_PED'
          ReadOnly = True
          Width = 58
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID_ORDEN'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_CREACION'
          ReadOnly = True
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_CORTE'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_UNION'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_MACARRON'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_MOTOR'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_MONTAJE'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_TERMINADO'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_PREPARADO'
          Width = 110
          Visible = True
        end>
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    inherited CEDetalleMiinsert: TMenuItem
      Visible = False
    end
    inherited CEDetalleMidelete: TMenuItem
      Visible = False
    end
    inherited CEDetalleMiedit: TMenuItem
      Visible = False
    end
    inherited CEDetalleMipost: TMenuItem
      Visible = False
    end
    inherited CEDetalleMicancel: TMenuItem
      Visible = False
    end
  end
end
