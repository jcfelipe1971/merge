inherited OpeFMEmpleados: TOpeFMEmpleados
  Left = 263
  Top = 147
  Width = 1663
  Height = 680
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Empleados'
  Constraints.MinHeight = 575
  Constraints.MinWidth = 765
  FormStyle = fsNormal
  PopupMenu = CEIncapacidadTransitoriaPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1653
    Height = 627
    inherited TBMain: TLFToolBar
      Width = 1649
      inherited NavMain: THYMNavigator
        DataSource = OpeDMEmpleados.DSQMEmpleados
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEFTercero
        InsertaControl = DBEFTercero
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Left = 296
        Visible = True
        OnClick = TbuttCompClick
      end
      object ToolButton4: TToolButton
        Left = 319
        Top = 0
        Action = ADocumentos
      end
      object TBCarpetas: TToolButton
        Left = 342
        Top = 0
        Hint = 'Explorar carpetas'
        Caption = 'Explorar carpetas'
        ImageIndex = 65
        ParentShowHint = False
        ShowHint = False
        OnClick = TBCarpetasClick
      end
      object ToolButton8: TToolButton
        Left = 365
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 373
        Top = 0
        Action = AMarcajes
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1649
      Height = 597
      ActivePage = TSIncapacidadTransitoria
      TabIndex = 10
      inherited TSFicha: TTabSheet
        object SBACalendario: TSpeedButton [0]
          Left = 352
          Top = 16
          Width = 153
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBACalendarioDblClick
        end
        object SBATercero: TSpeedButton [1]
          Left = 344
          Top = 8
          Width = 153
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBATerceroDblClick
        end
        object SBAJornada: TSpeedButton [2]
          Left = 360
          Top = 24
          Width = 153
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBAJornadaDblClick
        end
        object SBATipoJornada: TSpeedButton [3]
          Left = 368
          Top = 32
          Width = 153
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBAJornadaDblClick
        end
        object SBAAreas: TSpeedButton [4]
          Left = 376
          Top = 40
          Width = 153
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBAJornadaDblClick
        end
        object SBACCosto: TSpeedButton [5]
          Left = 384
          Top = 48
          Width = 153
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBAJornadaDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1641
          Height = 569
          inherited G2KTableLoc: TG2KTBLoc
            Top = 252
            Tabla_a_buscar = 'VER_EMPLEADOS_CUENTAS'
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'EMPLEADO')
          end
          object LblEmpleado: TLFLabel
            Left = 37
            Top = 3
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empleado'
            FocusControl = DBEEmpleado
          end
          object LblTercero: TLFLabel
            Left = 149
            Top = 3
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LblCategoria: TLFLabel
            Left = 39
            Top = 285
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Categoria'
          end
          object LblCentro: TLFLabel
            Left = 53
            Top = 306
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Centro'
          end
          object LblDepartamento: TLFLabel
            Left = 17
            Top = 328
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Departamento'
          end
          object LblSeccion: TLFLabel
            Left = 45
            Top = 350
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Secci'#243'n'
          end
          object LblCalendario: TLFLabel
            Left = 34
            Top = 372
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Calendario'
          end
          object LblNumSegSoc: TLFLabel
            Left = 489
            Top = 159
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Seguridad Social'
            FocusControl = DBENunSegSoc
          end
          object LblTipoContrato: TLFLabel
            Left = 20
            Top = 394
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Contrato'
          end
          object LblFinContrato: TLFLabel
            Left = 529
            Top = 240
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fin Contrato'
          end
          object LblFechaNacimiento: TLFLabel
            Left = 500
            Top = 3
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Nacimiento'
          end
          object LblEstadoCivil: TLFLabel
            Left = 530
            Top = 27
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado Civil'
          end
          object LblCodTarjeta: TLFLabel
            Left = 517
            Top = 136
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo Tarjeta'
            FocusControl = DBECodTar
          end
          object LblHorario: TLFLabel
            Left = 50
            Top = 416
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horario'
          end
          object LblImagen: TLFLabel
            Left = 704
            Top = 3
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object LRecursoDefecto: TLFLabel
            Left = 3
            Top = 438
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recurso Defecto'
          end
          object LTareaDefecto: TLFLabel
            Left = 15
            Top = 460
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarea Defecto'
          end
          object LUsuario: TLFLabel
            Left = 48
            Top = 482
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario'
          end
          object LID: TLFLabel
            Left = 525
            Top = 114
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID Empleado'
            FocusControl = DBECodTar
          end
          object LCliente: TLFLabel
            Left = 52
            Top = 526
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LDireccionCliente: TLFLabel
            Left = 39
            Top = 548
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion'
          end
          object LNombre: TLFLabel
            Left = 46
            Top = 48
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LTipoDocumento: TLFLabel
            Left = 28
            Top = 70
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Documento'
          end
          object LDireccion2: TLFLabel
            Left = 30
            Top = 174
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion 2'
          end
          object LNumero: TLFLabel
            Left = 308
            Top = 132
            Width = 44
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'N'#250'm.'
          end
          object LBLoqueEscalera: TLFLabel
            Left = 353
            Top = 132
            Width = 51
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bloq./Esc.'
          end
          object LPiso: TLFLabel
            Left = 405
            Top = 132
            Width = 34
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Piso'
          end
          object DBT_TipDir_T: TDBText
            Left = 119
            Top = 132
            Width = 188
            Height = 13
            Color = clBtnFace
            DataField = 'TITULO'
            DataSource = DMTerceros2.DSxTipDir_T
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object LPuerta: TLFLabel
            Left = 440
            Top = 132
            Width = 44
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Puerta'
          end
          object LTelefonos: TLFLabel
            Left = 36
            Top = 92
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Telefonos'
          end
          object LCorreo: TLFLabel
            Left = 52
            Top = 114
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Correo'
          end
          object LDireccion: TLFLabel
            Left = 39
            Top = 152
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion'
          end
          object LGenero: TLFLabel
            Left = 550
            Top = 69
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Genero'
          end
          object LContactoNombre: TLFLabel
            Left = 502
            Top = 482
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contacto'
          end
          object LContactoParentesco: TLFLabel
            Left = 497
            Top = 504
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prentesco'
          end
          object LContactoTelefono: TLFLabel
            Left = 503
            Top = 526
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Telefono'
          end
          object LFecUltimaLlamada: TLFLabel
            Left = 490
            Top = 305
            Width = 96
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Ultima Llamada'
          end
          object LPaisDireccion: TLFLabel
            Left = 282
            Top = 173
            Width = 20
            Height = 13
            Caption = 'Pais'
          end
          object LFechaIngreso: TLFLabel
            Left = 537
            Top = 217
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Ingreso'
          end
          object LOriundo: TLFLabel
            Left = 521
            Top = 48
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nacionalidad'
          end
          object LApellido: TLFLabel
            Left = 46
            Top = 26
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Apellido'
          end
          object LAMaterno: TLFLabel
            Left = 256
            Top = 26
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ape. Materno'
          end
          object LDiscapacidad: TLFLabel
            Left = 521
            Top = 195
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Discapacidad'
          end
          object LFLabel1: TLFLabel
            Left = 546
            Top = 326
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Jornada'
          end
          object LTipoJornada: TLFLabel
            Left = 522
            Top = 349
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Jornada'
          end
          object LHoras: TLFLabel
            Left = 556
            Top = 370
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horas'
          end
          object LArea: TLFLabel
            Left = 562
            Top = 393
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Area'
          end
          object LFLabel2: TLFLabel
            Left = 523
            Top = 415
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Centro Costo'
          end
          object LVenPlazoFijo: TLFLabel
            Left = 492
            Top = 262
            Width = 94
            Height = 13
            Alignment = taRightJustify
            Caption = '2do Venc Plazo Fijo'
          end
          object LMedioPago: TLFLabel
            Left = 512
            Top = 437
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medio de Pago'
          end
          object LProyecto: TLFLabel
            Left = 503
            Top = 548
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
          end
          object LEmpresaDstReparacion: TLFLabel
            Left = 984
            Top = 25
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empresa'
          end
          object LSerieDstReparacion: TLFLabel
            Left = 1001
            Top = 47
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LDestinoReparaciones: TLFLabel
            Left = 984
            Top = 3
            Width = 126
            Height = 13
            Caption = 'Destino Reparaciones'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEEmpleado: TLFDbedit
            Left = 88
            Top = 0
            Width = 49
            Height = 21
            DataField = 'EMPLEADO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEFTercero: TLFDBEditFind2000
            Left = 190
            Top = 0
            Width = 49
            Height = 21
            DataField = 'TERCERO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 1
            OnChange = DBEFTerceroChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TERCEROS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_R_SOCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCategoria: TLFDBEditFind2000
            Left = 88
            Top = 280
            Width = 31
            Height = 21
            DataField = 'CATEGORIA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 24
            OnChange = DBEFCategoriaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_SYS_EMPLEADO_CAT'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CATEGORIA'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CATEGORIA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFDepartamento: TLFDBEditFind2000
            Left = 88
            Top = 324
            Width = 31
            Height = 21
            DataField = 'DEPARTAMENTO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 28
            OnChange = DBEFDepartamentoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_DEPARTAMENTOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DEPARTAMENTO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'DEPARTAMENTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCentro: TLFDBEditFind2000
            Left = 88
            Top = 302
            Width = 31
            Height = 21
            DataField = 'CENTRO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 26
            OnChange = DBEFCentroChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_CENT_TRABAJO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CENTRO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CENTRO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFSeccion: TLFDBEditFind2000
            Left = 88
            Top = 346
            Width = 31
            Height = 21
            DataField = 'SECCION'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 30
            OnChange = DBEFSeccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_SECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SECCION'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'SECCION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCal: TLFDBEditFind2000
            Left = 88
            Top = 368
            Width = 31
            Height = 21
            DataField = 'CALENDARIO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 32
            OnChange = DBEFCalChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_CALENDARIO_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CALENDARIO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CALENDARIO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBENunSegSoc: TLFDbedit
            Left = 589
            Top = 154
            Width = 110
            Height = 21
            DataField = 'N_SEGURIDAD_SOCIAL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 62
          end
          object DBEFTipContrato: TLFDBEditFind2000
            Left = 88
            Top = 390
            Width = 31
            Height = 21
            DataField = 'TIPO_CONTRATO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 34
            OnChange = DBEFTipContratoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_SYS_TIPOS_CONTRATOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDTPFechaNac: TLFDBDateEdit
            Left = 589
            Top = 0
            Width = 110
            Height = 21
            DataField = 'FECHA_NACIMIENTO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 51
          end
          object DBECodTar: TLFDbedit
            Left = 589
            Top = 132
            Width = 110
            Height = 21
            DataField = 'CODIGO_TARJETA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 61
          end
          object ScrBImagen: TScrollBox
            Left = 742
            Top = 30
            Width = 194
            Height = 147
            BevelEdges = []
            BevelInner = bvNone
            BevelOuter = bvNone
            TabOrder = 87
            object Imagen: TImage
              Left = 0
              Top = 0
              Width = 190
              Height = 143
              Align = alClient
              Center = True
              Proportional = True
            end
          end
          object DBEFRecurso: TLFDBEditFind2000
            Left = 88
            Top = 434
            Width = 48
            Height = 21
            DataField = 'RECURSO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 38
            OnChange = DBEFRecursoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_RECURSOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'RECURSO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFImputacion: TLFDBEditFind2000
            Left = 209
            Top = 500
            Width = 48
            Height = 21
            DataField = 'IMPUTACION'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Enabled = False
            TabOrder = 45
            OnChange = DBEFImputacionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_EMPLEADO_PRE'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'LINEA'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFImputacionBusqueda
            OrdenadoPor.Strings = (
              'LINEA')
            Filtros = []
          end
          object DBEFHorario: TLFDBEditFind2000
            Left = 88
            Top = 412
            Width = 31
            Height = 21
            DataField = 'HORARIO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 36
            OnChange = DBEFHorarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_HORARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'HORARIO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'HORARIO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFImagen: TLFFibDBEditFind
            Left = 742
            Top = 0
            Width = 50
            Height = 21
            DataField = 'ID_IMAGEN'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 52
            OnChange = DBEFImagenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IMAGENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object DescTercero: TLFHYDBDescription
            Left = 240
            Top = 0
            Width = 244
            Height = 21
            Color = clAqua
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Tabla_a_buscar = 'VER_TERCEROS'
            Campo_Descripcion = 'NOMBRE_R_SOCIAL'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TERCERO')
            CamposWhereTabla.Strings = (
              'TERCERO')
          end
          object DescCategoria: TLFHYDBDescription
            Left = 120
            Top = 280
            Width = 364
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 25
            Tabla_a_buscar = 'OPE_SYS_EMPLEADO_CAT'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'CATEGORIA')
            CamposWhereTabla.Strings = (
              'CATEGORIA')
          end
          object DescCentro: TLFHYDBDescription
            Left = 120
            Top = 302
            Width = 364
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 27
            Tabla_a_buscar = 'OPE_CENT_TRABAJO'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'CENTRO'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'CENTRO'
              'EMPRESA')
          end
          object DescDepartamento: TLFHYDBDescription
            Left = 120
            Top = 324
            Width = 364
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 29
            Tabla_a_buscar = 'OPE_DEPARTAMENTOS'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'DEPARTAMENTO'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'DEPARTAMENTO'
              'EMPRESA')
          end
          object DescSeccion: TLFHYDBDescription
            Left = 120
            Top = 346
            Width = 364
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 31
            Tabla_a_buscar = 'OPE_SECCIONES'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'SECCION')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'SECCION')
          end
          object DescCalendario: TLFHYDBDescription
            Left = 120
            Top = 368
            Width = 364
            Height = 21
            TabStop = False
            Color = clAqua
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 33
            Tabla_a_buscar = 'OPE_CALENDARIO_C'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'CALENDARIO'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'CALENDARIO'
              'EMPRESA')
          end
          object DescTipoContrato: TLFHYDBDescription
            Left = 120
            Top = 390
            Width = 364
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 35
            Tabla_a_buscar = 'OPE_SYS_TIPOS_CONTRATOS'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPO_CONTRATO')
            CamposWhereTabla.Strings = (
              'TIPO')
          end
          object DescRecurso: TLFHYDBDescription
            Left = 137
            Top = 434
            Width = 347
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 39
            Tabla_a_buscar = 'PRO_RECURSOS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'RECURSO')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'RECURSO')
          end
          object DescHorario: TLFHYDBDescription
            Left = 120
            Top = 412
            Width = 364
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 37
            Tabla_a_buscar = 'OPE_HORARIOS'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'HORARIO')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'HORARIO')
          end
          object ETituloImagen: TLFEdit
            Left = 793
            Top = 0
            Width = 143
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 53
          end
          object DBEFTTarea: TLFDBEditFind2000
            Left = 88
            Top = 456
            Width = 48
            Height = 21
            DataField = 'TIPOTAREA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 40
            OnChange = DBEFTTareaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TAREA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescTTarea: TLFHYDBDescription
            Left = 137
            Top = 456
            Width = 347
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 41
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPOTAREA')
            CamposWhereTabla.Strings = (
              'TAREA')
          end
          object DescImputacion: TLFDbedit
            Left = 258
            Top = 500
            Width = 226
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = OpeDMEmpleados.DSQMTImputacion
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 46
          end
          object DBCBImputacion: TLFDBCheckBox
            Left = 88
            Top = 503
            Width = 119
            Height = 17
            Caption = 'Imputaci'#243'n de costes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 44
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCBImputacionChange
            DataField = 'TIPOIMPUTACION'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ValueChecked = '2'
            ValueUnchecked = '1'
          end
          object BCargarImagen: TButton
            Left = 888
            Top = 2
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 54
            Visible = False
            OnClick = BCargarImagenClick
          end
          object EUsuario: TLFEdit
            Left = 137
            Top = 478
            Width = 347
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 43
          end
          object DBEFUsuario: TLFDBEditFind2000
            Left = 88
            Top = 478
            Width = 48
            Height = 21
            DataField = 'USUARIO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 42
            OnChange = DBEFUsuarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_USUARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'USUARIO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'NOMBRE')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCBActivo: TLFDBCheckBox
            Left = 502
            Top = 90
            Width = 101
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 59
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEIdEmpleado: TLFDbedit
            Left = 589
            Top = 110
            Width = 110
            Height = 21
            Color = clInfoBk
            DataField = 'ID_EMPLEADO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ReadOnly = True
            TabOrder = 60
          end
          object BClipboard: TButton
            Left = 911
            Top = 2
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 55
            Visible = False
            OnClick = BClipboardClick
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 88
            Top = 522
            Width = 48
            Height = 21
            DataField = 'CLIENTE'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 47
            OnChange = DBEFClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECliente: TLFEdit
            Left = 137
            Top = 522
            Width = 347
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 48
          end
          object DBEFDireccion: TLFDBEditFind2000
            Left = 88
            Top = 544
            Width = 48
            Height = 21
            DataField = 'DIRECCION_CLIENTE'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 49
            OnChange = DBEFDireccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DIRECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DIRECCION'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFDireccionBusqueda
            OrdenadoPor.Strings = (
              'DIRECCION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EDireccion: TLFEdit
            Left = 137
            Top = 544
            Width = 347
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 50
          end
          object DBCBApto: TLFDBCheckBox
            Left = 640
            Top = 193
            Width = 65
            Height = 17
            Caption = 'Apto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 64
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'APTO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBENombre: TLFDbedit
            Left = 88
            Top = 44
            Width = 396
            Height = 21
            DataField = 'NOMBRE'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 5
          end
          object DBEPaisTercero: TLFDBEditFind2000
            Left = 88
            Top = 66
            Width = 47
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PAIS_TERCERO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 6
            OnExit = DBEPaisTerceroExit
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PAISES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PAIS'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBETipoDocumento: TLFDBEditFind2000
            Left = 136
            Top = 66
            Width = 47
            Height = 21
            DataField = 'TIPO_DOC_IDENT'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 7
            OnChange = DBETipoDocumentoChange
            OnExit = DBETipoDocumentoExit
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_DOC_IDENT_PAIS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO_DOC_IDENT'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBETipoDocumentoBusqueda
            Filtros = []
          end
          object ETipoDocumentoTitulo: TLFEdit
            Left = 184
            Top = 66
            Width = 167
            Height = 21
            TabStop = False
            Color = clInfoBk
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
          object DBECif: TLFDbedit
            Left = 352
            Top = 66
            Width = 132
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NIF'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnChange = DBECifChange
            OnExit = DBECifExit
          end
          object DBEDirNombre: TLFDbedit
            Left = 118
            Top = 148
            Width = 188
            Height = 21
            DataField = 'DIR_NOMBRE'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 14
          end
          object DBEDirBloqEsc: TLFDbedit
            Left = 352
            Top = 148
            Width = 51
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIR_BLOQUE_ESCALERA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 16
          end
          object DBEDirPiso: TLFDbedit
            Left = 404
            Top = 148
            Width = 34
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIR_PISO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 17
          end
          object DBEDirNumero: TLFDbedit
            Left = 307
            Top = 148
            Width = 44
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIR_NUMERO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 15
          end
          object DBETipoDir: TLFDBEditFind2000
            Left = 88
            Top = 148
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIR_TIPO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 13
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_DIRECCION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CampoADevolver = 'TIPO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEDirPuerta: TLFDbedit
            Left = 439
            Top = 148
            Width = 45
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIR_PUERTA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 18
          end
          object DBEDireccion2: TLFDbedit
            Left = 88
            Top = 170
            Width = 188
            Height = 21
            DataField = 'DIR_NOMBRE_2'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 19
          end
          object DBETelefono1: TLFDbedit
            Left = 88
            Top = 88
            Width = 131
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TELEFONO01'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            OnChange = DBECifChange
            OnExit = DBECifExit
          end
          object DBETelefono2: TLFDbedit
            Left = 220
            Top = 88
            Width = 131
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TELEFONO02'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnChange = DBECifChange
            OnExit = DBECifExit
          end
          object DBECorreo: TLFDbedit
            Left = 88
            Top = 110
            Width = 396
            Height = 21
            DataField = 'EMAIL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            OnChange = DBECifChange
            OnExit = DBECifExit
          end
          object DBCBGenero: TRxDBComboBox
            Left = 589
            Top = 66
            Width = 110
            Height = 21
            DataField = 'GENERO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ItemHeight = 13
            Items.Strings = (
              'Desconocido'
              'Hombre'
              'Mujer')
            TabOrder = 58
            Values.Strings = (
              ' '
              'H'
              'M')
          end
          object DBEContacto: TLFDbedit
            Left = 550
            Top = 478
            Width = 380
            Height = 21
            DataField = 'CONTACTO_NOMBRE'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ParentShowHint = False
            ShowHint = True
            TabOrder = 82
            OnChange = DBECifChange
            OnExit = DBECifExit
          end
          object DBEParentesco: TLFDbedit
            Left = 550
            Top = 500
            Width = 380
            Height = 21
            DataField = 'CONTACTO_PARENTESCO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ParentShowHint = False
            ShowHint = True
            TabOrder = 83
            OnChange = DBECifChange
            OnExit = DBECifExit
          end
          object DBEContactoTelefono: TLFDbedit
            Left = 550
            Top = 522
            Width = 130
            Height = 21
            DataField = 'CONTACTO_TELEFONO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ParentShowHint = False
            ShowHint = True
            TabOrder = 84
            OnChange = DBECifChange
            OnExit = DBECifExit
          end
          object DBDEFecUltimaLlamada: TLFDBDateEdit
            Left = 589
            Top = 301
            Width = 110
            Height = 21
            DataField = 'FEC_ULTIMA_LLAMADA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 70
          end
          object DBCBContratoSuspendido: TLFDBCheckBox
            Left = 496
            Top = 281
            Width = 90
            Height = 17
            Caption = 'Contr. Susp.'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 68
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CONTRATO_SUSPENDIDO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDEFechaSuspencionContrato: TLFDBDateEdit
            Left = 589
            Top = 279
            Width = 110
            Height = 21
            DataField = 'SUSPENCION_CONTRATO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 69
          end
          object PnlDireccion: TPanel
            Left = 0
            Top = 192
            Width = 489
            Height = 88
            BevelOuter = bvNone
            TabOrder = 22
            object SBNuevaLocalidadFicha: TSpeedButton
              Left = 24
              Top = 1
              Width = 56
              Height = 21
              Hint = 'Crea una nueva localidad'
              Caption = 'Nueva'
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object LProvincia: TLFLabel
              Left = 39
              Top = 26
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Provincia'
            end
            object LLocalidad: TLFLabel
              Left = 29
              Top = 4
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'Localidad'
            end
            object DBEPais: TLFDbedit
              Left = 298
              Top = 22
              Width = 186
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'PAIS'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object DBECpostal: TLFDbedit
              Left = 352
              Top = 0
              Width = 132
              Height = 21
              Color = clInfoBk
              DataField = 'CODIGO_POSTAL'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBELocalidadNombre: TLFDbedit
              Left = 166
              Top = 0
              Width = 185
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO_LOCALIDAD'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBEProvincia: TLFDbedit
              Left = 88
              Top = 22
              Width = 209
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'PROVINCIA'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object EFLocalidad: TLFDBEditFind2000
              Left = 88
              Top = 0
              Width = 77
              Height = 21
              DataField = 'DIR_LOCALIDAD'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              ParentShowHint = False
              ShowHint = False
              TabOrder = 0
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_LOCALIDADES'
              Tabla_asociada.DesplegarBusqueda = False
              Campos_Desplegar.Strings = (
                'provincia'
                'c_pais')
              CampoNum = 'CODPOSTAL'
              CampoStr = 'TITULO'
              CampoADevolver = 'LOCALIDAD'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object DBEPaisDireccion: TLFDBEditFind2000
            Left = 307
            Top = 170
            Width = 44
            Height = 21
            DataField = 'PAIS_DIRECCION'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 20
            OnChange = DBEPaisDireccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PAISES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PAIS'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object ETituloPaisDireccion: TLFEdit
            Left = 352
            Top = 170
            Width = 132
            Height = 21
            TabStop = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
            Text = 'ETituloPaisDireccion'
          end
          object PnlDireccion2: TLFPanel
            Left = 0
            Top = 192
            Width = 489
            Height = 88
            BevelOuter = bvNone
            TabOrder = 23
            object LRegion: TLFLabel
              Left = 50
              Top = 3
              Width = 34
              Height = 13
              Caption = 'Region'
            end
            object LProvinciaDireccion: TLFLabel
              Left = 40
              Top = 25
              Width = 44
              Height = 13
              Caption = 'Provincia'
            end
            object LPoblacion: TLFLabel
              Left = 38
              Top = 47
              Width = 47
              Height = 13
              Caption = 'Poblacion'
            end
            object LCodigoPostal: TLFLabel
              Left = 31
              Top = 69
              Width = 54
              Height = 13
              Caption = 'Cod. Postal'
            end
            object ETituloRegion: TLFEdit
              Left = 149
              Top = 0
              Width = 336
              Height = 21
              TabStop = False
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Text = 'ETituloRegion'
            end
            object ETituloProvinciaTercero: TLFEdit
              Left = 149
              Top = 22
              Width = 336
              Height = 21
              TabStop = False
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Text = 'ETituloProvinciaTercero'
            end
            object ETituloPoblacion: TLFEdit
              Left = 149
              Top = 44
              Width = 336
              Height = 21
              TabStop = False
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              Text = 'ETituloPoblacion'
            end
            object ETituloCodigoPostal: TLFEdit
              Left = 149
              Top = 66
              Width = 336
              Height = 21
              TabStop = False
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              Text = 'ETituloCodigoPostal'
            end
            object DBERegion: TLFDBEditFind2000
              Left = 88
              Top = 0
              Width = 60
              Height = 21
              DataField = 'REGION_DIRECCION'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              TabOrder = 0
              OnChange = DBERegionChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_REGIONES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'REGION'
              CampoStr = 'TITULO'
              CampoADevolver = 'REGION'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OnBusqueda = DBERegionBusqueda
              Filtros = []
            end
            object DBEProvinciaDireccion: TLFDBEditFind2000
              Left = 88
              Top = 22
              Width = 60
              Height = 21
              DataField = 'PROVINCIA_DIRECCION'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              TabOrder = 2
              OnChange = DBEProvinciaDireccionChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_PROVINCIAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'PROVINCIA'
              CampoStr = 'PR_TITULO'
              CampoADevolver = 'PROVINCIA'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEProvinciaDireccionBusqueda
              Filtros = []
            end
            object EFPoblacion: TLFDBEditFind2000
              Left = 88
              Top = 44
              Width = 60
              Height = 21
              DataField = 'POBLACION_DIRECCION'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              TabOrder = 4
              OnChange = EFPoblacionChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_POBLACION'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'POBLACION'
              CampoStr = 'TITULO'
              CampoADevolver = 'POBLACION'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = EFPoblacionBusqueda
              Filtros = []
            end
            object EFCodigoPostal: TLFDBEditFind2000
              Left = 88
              Top = 66
              Width = 60
              Height = 21
              DataField = 'CODIGO_POSTAL_DIRECCION'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              TabOrder = 6
              OnChange = EFCodigoPostalChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_CODIGOS_POSTALES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODIGO_POSTAL'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = EFCodigoPostalBusqueda
              Filtros = []
            end
          end
          object LFDBDateEdit1: TLFDBDateEdit
            Left = 589
            Top = 213
            Width = 110
            Height = 21
            DataField = 'FECHA_INGRESO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 65
          end
          object DBCBNacionalidad: TLFDBComboBoxValue
            Left = 589
            Top = 44
            Width = 110
            Height = 21
            DataField = 'NACIONALIDAD'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ItemHeight = 13
            Items.Strings = (
              'Nacional'
              'Extranjero')
            Values.Strings = (
              '0'
              '1')
            TabOrder = 57
          end
          object DBEApellido: TLFDbedit
            Left = 88
            Top = 22
            Width = 160
            Height = 21
            DataField = 'APELLIDO_PATERNO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 3
          end
          object DBEAMaterno: TLFDbedit
            Left = 324
            Top = 22
            Width = 160
            Height = 21
            DataField = 'APELLIDO_MATERNO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 4
          end
          object DBCBEstadoCivil: TRxDBComboBox
            Left = 589
            Top = 22
            Width = 110
            Height = 21
            DataField = 'ESTADO_CIVIL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ItemHeight = 13
            Items.Strings = (
              'Soltero'
              'Casado')
            TabOrder = 56
            Values.Strings = (
              'Soltero'
              'Casado')
          end
          object DBCBDiscapacidad: TRxDBComboBox
            Left = 589
            Top = 192
            Width = 49
            Height = 21
            DataField = 'MINUSVALIA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ItemHeight = 13
            Items.Strings = (
              'No'
              'Si')
            TabOrder = 63
            Values.Strings = (
              '0'
              '1')
          end
          object DBDTPFechaFin: TLFDBDateEdit
            Left = 589
            Top = 235
            Width = 110
            Height = 21
            DataField = 'FIN_CONTRATO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 66
          end
          object DBEJornada: TLFDBEditFind2000
            Left = 589
            Top = 323
            Width = 49
            Height = 21
            DataField = 'JORNADA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 71
            OnChange = DBEJornadaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_JORNADA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescripcionJornada: TLFEdit
            Left = 639
            Top = 324
            Width = 167
            Height = 21
            TabStop = False
            Color = clAqua
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 72
          end
          object EDescripcionTipoJornada: TLFEdit
            Left = 639
            Top = 346
            Width = 167
            Height = 21
            TabStop = False
            Color = clAqua
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 74
          end
          object DBETipoJornada: TLFDBEditFind2000
            Left = 589
            Top = 346
            Width = 49
            Height = 21
            DataField = 'TIPO_JORNADA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 73
            OnChange = DBETipoJornadaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_TIPO_JORNADA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEHoras: TLFDbedit
            Left = 589
            Top = 368
            Width = 110
            Height = 21
            CharCase = ecUpperCase
            DataField = 'HORAS'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ParentShowHint = False
            ShowHint = True
            TabOrder = 75
            OnChange = DBECifChange
            OnExit = DBECifExit
          end
          object DBEArea: TLFDBEditFind2000
            Left = 589
            Top = 390
            Width = 49
            Height = 21
            DataField = 'AREA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 76
            OnChange = DBEAreaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_AREAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescripcionArea: TLFEdit
            Left = 639
            Top = 390
            Width = 167
            Height = 21
            TabStop = False
            Color = clAqua
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 77
          end
          object DBECentroCosto: TLFDBEditFind2000
            Left = 589
            Top = 412
            Width = 49
            Height = 21
            DataField = 'CENTRO_DE_COSTO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 78
            OnChange = DBECentroCostoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_CENTRO_DE_COSTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescripcionCentroCosto: TLFEdit
            Left = 639
            Top = 412
            Width = 167
            Height = 21
            TabStop = False
            Color = clAqua
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 79
          end
          object DBDTPVenPlazoFijo: TLFDBDateEdit
            Left = 589
            Top = 257
            Width = 110
            Height = 21
            DataField = 'VENCIMIENTO_PLAZO_FIJO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 67
          end
          object DBEMedioPago: TLFDBEditFind2000
            Left = 589
            Top = 434
            Width = 49
            Height = 21
            DataField = 'MEDIO_DE_PAGO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 80
            OnChange = DBEMedioPagoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_EFECTO'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'TIPO'
              'TITULO')
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescripcionMedioPago: TLFEdit
            Left = 639
            Top = 434
            Width = 167
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 81
          end
          object DBEFProyecto: TDBEditFind2000
            Left = 550
            Top = 544
            Width = 43
            Height = 21
            DataField = 'PROYECTO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 85
            OnChange = DBEFProyectoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            CampoADevolver = 'PROYECTO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EProyecto: TLFEdit
            Left = 594
            Top = 544
            Width = 335
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 86
          end
          object DBEFEmpresaDstReparacion: TDBEditFind2000
            Left = 1030
            Top = 22
            Width = 43
            Height = 21
            DataField = 'REPAR_EMPRESA_DST'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 88
            OnChange = DBEFEmpresaDstReparacionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_EMPRESAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPRESA'
            CampoStr = 'TITULO'
            CampoADevolver = 'EMPRESA'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'EMPRESA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EEmpresaDstReparacion: TLFEdit
            Left = 1074
            Top = 22
            Width = 335
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 89
          end
          object ESerieDstReparacion: TLFEdit
            Left = 1074
            Top = 44
            Width = 335
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 91
          end
          object DBEFSerieDstReparacion: TDBEditFind2000
            Left = 1030
            Top = 44
            Width = 43
            Height = 21
            DataField = 'REPAR_SERIE_DST'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 90
            OnChange = DBEFSerieDstReparacionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            CampoADevolver = 'SERIE'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFSerieDstReparacionBusqueda
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        object PEditNotas: TLFPanel
          Left = 0
          Top = 25
          Width = 1641
          Height = 544
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBNotas: TLFToolBar
            Left = 0
            Top = 0
            Width = 1641
            Height = 24
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Images = DMMain.ToolbarImages
            TabOrder = 0
            Separators = True
            object TButtUndo: TToolButton
              Left = 0
              Top = 0
              Caption = 'Deshacer'
              ImageIndex = 4
              OnClick = TButtUndoClick
            end
            object TButtCut: TToolButton
              Left = 23
              Top = 0
              Caption = 'Cortar'
              ImageIndex = 5
              OnClick = TButtCutClick
            end
            object TButtCopy: TToolButton
              Left = 46
              Top = 0
              Caption = 'Copiar'
              ImageIndex = 6
              OnClick = TButtCopyClick
            end
            object TButtPaste: TToolButton
              Left = 69
              Top = 0
              Caption = 'Pegar'
              ImageIndex = 7
              OnClick = TButtPasteClick
            end
            object ToolButton6: TToolButton
              Left = 92
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object FontName: TLFComboBox
              Left = 100
              Top = 0
              Width = 145
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              OnChange = FontNameChange
            end
            object FontSize: TLFEdit
              Left = 245
              Top = 0
              Width = 22
              Height = 22
              TabOrder = 1
              Text = '0'
              OnChange = FontSizeChange
            end
            object UpDown1: TUpDown
              Left = 267
              Top = 0
              Width = 15
              Height = 22
              Associate = FontSize
              Min = 0
              Position = 0
              TabOrder = 2
              Wrap = False
            end
            object ToolButton3: TToolButton
              Left = 282
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtNegrita: TToolButton
              Left = 290
              Top = 0
              Caption = 'Negrita'
              ImageIndex = 8
              Style = tbsCheck
              OnClick = TButtNegritaClick
            end
            object TButtCursiva: TToolButton
              Left = 313
              Top = 0
              Caption = 'Cursiva'
              ImageIndex = 9
              Style = tbsCheck
              OnClick = TButtCursivaClick
            end
            object TButtSubrayado: TToolButton
              Left = 336
              Top = 0
              Caption = 'Subrayado'
              ImageIndex = 10
              Style = tbsCheck
              OnClick = TButtSubrayadoClick
            end
            object ToolButton7: TToolButton
              Left = 359
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtLeftAlign: TToolButton
              Left = 367
              Top = 0
              Caption = 'Alinear izquierda'
              Grouped = True
              ImageIndex = 11
              Style = tbsCheck
              OnClick = TButtLeftAlignClick
            end
            object TButtCenterAlign: TToolButton
              Tag = 2
              Left = 390
              Top = 0
              Caption = 'Centrar'
              Grouped = True
              ImageIndex = 12
              Style = tbsCheck
              OnClick = TButtCenterAlignClick
            end
            object TButtRightAlign: TToolButton
              Tag = 1
              Left = 413
              Top = 0
              Caption = 'Alinear derecha'
              Grouped = True
              ImageIndex = 13
              Style = tbsCheck
              OnClick = TButtRightAlignClick
            end
            object ToolButton1: TToolButton
              Left = 436
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TButtColor: TToolButton
              Left = 444
              Top = 0
              Caption = 'Color'
              ImageIndex = 15
              OnClick = TButtColorClick
            end
          end
          object PNLNotas: TLFPanel
            Left = 0
            Top = 24
            Width = 1641
            Height = 520
            Align = alClient
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBMNotas: TDBRichEdit
              Left = 0
              Top = 0
              Width = 1641
              Height = 520
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              DataField = 'NOTAS'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              TabOrder = 0
              OnSelectionChange = SelectionChange
            end
          end
        end
        object PNLCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 1641
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LEmpleadoNotas: TLFLabel
            Left = 11
            Top = 5
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empleado'
            FocusControl = DBEmpleadoNotas
          end
          object LTerceroNotas: TLFLabel
            Left = 107
            Top = 5
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object DBEmpleadoNotas: TLFDbedit
            Left = 62
            Top = 2
            Width = 40
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'EMPLEADO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEDescTerceroNotas: TLFDbedit
            Left = 214
            Top = 2
            Width = 225
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescTercero'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBETerceroNotas: TLFDbedit
            Left = 148
            Top = 2
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'TERCERO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object NavNotas: THYMNavigator
            Left = 449
            Top = 1
            Width = 84
            Height = 23
            DataSource = OpeDMEmpleados.DSQMEmpleados
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 3
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMNotas
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSFormacion: TTabSheet [2]
        Caption = 'F&ormaci'#243'n'
        ImageIndex = 3
        object LFPanelFormacion: TLFPanel
          Left = 0
          Top = 0
          Width = 1641
          Height = 569
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFPanelCursos: TLFPanel
            Left = 0
            Top = 186
            Width = 1641
            Height = 383
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object DBGCursos: TDBGridFind2000
              Left = 0
              Top = 27
              Width = 1641
              Height = 356
              Align = alClient
              DataSource = OpeDMEmpleados.DSxVerCursoEmpl
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FSMain
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
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = 2
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              Campos.Strings = (
                'CURSO')
              CamposAMostrar.Strings = (
                'CURSO'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                '')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'FECHA'
                'EVALUACION')
              ColumnasCheckBoxes.Strings = (
                'ISO_APROBADO'
                'ISO_VALIDADO'
                'ISO_VERIFICADO')
              ColumnasChecked.Strings = (
                '1'
                '1'
                '1')
              ColumnasNoChecked.Strings = (
                '0'
                '0'
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'ID_CURSO')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'ISO_CURSOS')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'DESCRIPCION')
              Posicion = tpCentrado
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                '')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ID_CURSO'
                  Width = 46
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_CURSO'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_RESULTADO'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_INICIO'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_FIN'
                  Width = 80
                  Visible = True
                end>
            end
            object TBCursos: TLFToolBar
              Left = 0
              Top = 0
              Width = 1641
              Height = 27
              EdgeInner = esNone
              EdgeOuter = esNone
              Flat = True
              TabOrder = 1
              Separators = True
              object NavCursos: THYMNavigator
                Left = 0
                Top = 0
                Width = 100
                Height = 22
                DataSource = OpeDMEmpleados.DSxVerCursoEmpl
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
                Flat = True
                ParentShowHint = False
                PopupMenu = CECursosPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGCursos
                InsertaControl = DBGCursos
                Exclusivo = True
                ControlEdit = CECursos
                OrdenAscendente = True
                InsertaUltimo = True
              end
            end
          end
          object LFPFormacionDatos: TLFPanel
            Left = 0
            Top = 25
            Width = 1641
            Height = 161
            Align = alTop
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object LFormacionInicial: TLFLabel
              Left = 0
              Top = 0
              Width = 1641
              Height = 13
              Align = alTop
              Caption = 'Formaci'#243'n Inicial'
            end
            object LExperienciaProfesional: TLFLabel
              Left = 0
              Top = 53
              Width = 1641
              Height = 13
              Align = alTop
              Caption = 'Experiencia profesional'
            end
            object LFormacionEspecifica: TLFLabel
              Left = 0
              Top = 106
              Width = 1641
              Height = 13
              Align = alTop
              Caption = 'Formaci'#243'n espec'#237'fica / Habilidades'
            end
            object LFDBFormacionIni: TLFDBMemo
              Left = 0
              Top = 13
              Width = 1641
              Height = 40
              Align = alTop
              DataField = 'FORMACION_INI'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              TabOrder = 0
            end
            object LFDBExpProf: TLFDBMemo
              Left = 0
              Top = 66
              Width = 1641
              Height = 40
              Align = alTop
              DataField = 'EXPERIENCIA_PROF'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              TabOrder = 1
            end
            object LFDBFormacionEspHab: TLFDBMemo
              Left = 0
              Top = 119
              Width = 1641
              Height = 42
              Align = alClient
              BevelOuter = bvNone
              DataField = 'FORMACIONESPHAB'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              TabOrder = 2
            end
          end
          object TBFormacion: TLFToolBar
            Left = 0
            Top = 0
            Width = 1641
            Height = 25
            ButtonHeight = 21
            EdgeBorders = []
            Flat = True
            TabOrder = 2
            Separators = True
            object DBETerceroFormacion: TLFDbedit
              Left = 0
              Top = 0
              Width = 65
              Height = 21
              Color = clInfoBk
              DataField = 'EMPLEADO'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBETituloTerceroFormacion: TLFDbedit
              Left = 65
              Top = 0
              Width = 242
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DescTercero'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object ToolButton2: TToolButton
              Left = 307
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object NavFormacion: THYMNavigator
              Left = 315
              Top = 0
              Width = 84
              Height = 21
              DataSource = OpeDMEmpleados.DSQMEmpleados
              VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CEFormacionOpePMEdit
              ShowHint = True
              TabOrder = 2
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = LFDBFormacionIni
              Exclusivo = True
              ControlEdit = CEFormacionOpe
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
        end
      end
      object TSNomina: TTabSheet [3]
        Caption = 'N'#243'&mina'
        object PNLCuentas: TLFPanel
          Left = 0
          Top = 25
          Width = 1641
          Height = 544
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFCtaSeguroSocial: TLFLabel
            Left = 42
            Top = 81
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Seguro Social'
          end
          object LFCtaRetencion: TLFLabel
            Left = 59
            Top = 37
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Retenci'#243'n'
          end
          object LFCtaRemuneracion: TLFLabel
            Left = 39
            Top = 59
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Remuneraci'#243'n'
          end
          object LFCtaDevengo: TLFLabel
            Left = 64
            Top = 15
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Devengo'
          end
          object LCtaAnticipo: TLFLabel
            Left = 70
            Top = 103
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Anticipo'
          end
          object LFCtaSeguroSocialEmpresa: TLFLabel
            Left = 15
            Top = 125
            Width = 115
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Seguro Social Emp.'
          end
          object LCodigoGestoria: TLFLabel
            Left = 55
            Top = 281
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo Gestoria'
            FocusControl = DBECodigoGestoria
          end
          object LCtaSIngServSociales: TLFLabel
            Left = 22
            Top = 169
            Width = 108
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta Ing. Serv. Sociales'
          end
          object LCtaRetribucionesEspecieSocios: TLFLabel
            Left = 23
            Top = 147
            Width = 107
            Height = 13
            Alignment = taRightJustify
            Caption = 'Retrib. Especie Socios'
          end
          object LCtaICECES: TLFLabel
            Left = 70
            Top = 213
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. ICECES'
          end
          object LCtaCERETA: TLFLabel
            Left = 62
            Top = 235
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. CE RETA'
          end
          object LCtaRetribucionEspeciaAutonomo: TLFLabel
            Left = 7
            Top = 191
            Width = 123
            Height = 13
            Alignment = taRightJustify
            Caption = 'Retrib. Especie Autonomo'
          end
          object LEjemploContabilizacionNomina: TLabel
            Left = 562
            Top = 33
            Width = 280
            Height = 280
            Caption = 
              'Ejemplo:'#13#10#13#10'NOMINA'#13#10'6400      | Devengado'#13#10'     4751 | Retencion' +
              #13#10'     4751 | Retencion Especie'#13#10'     4650 | Remuneracion'#13#10'     ' +
              '4650 | Remuneracion Especie'#13#10'     4650 | Remuneracion Dietas'#13#10'  ' +
              '   4760 | Seguridad Social Trabajador'#13#10'     4650 | Embargo'#13#10'6400' +
              '      | Retribucion Especie Socios'#13#10'     7550 | Ingreso Servicio' +
              ' Social'#13#10'6400      | Retribucion Especie Autonomo'#13#10'     4760 | C' +
              'E RETA'#13#10'     4751 | ICECES'#13#10#13#10'SEG. SOCIAL'#13#10'6420      | Seguridad' +
              ' Social Empresa'#13#10'     4760 | Seguridad Social Empresa'
            Color = clInfoBk
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object LBancoCuenta: TLFLabel
            Left = 96
            Top = 353
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
            FocusControl = DBE_B_Sucursal
          end
          object LBancoEntidad: TLFLabel
            Left = 94
            Top = 331
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Entidad'
          end
          object LBancoIBAN: TLFLabel
            Left = 105
            Top = 374
            Width = 25
            Height = 13
            Hint = 'International Bank Account Number'
            Alignment = taRightJustify
            Caption = 'IBAN'
          end
          object LBancoBIC: TLFLabel
            Left = 74
            Top = 396
            Width = 56
            Height = 13
            Hint = 
              'Bank Identification Code'#13#10'Society for Worldwide Interbank Financ' +
              'ial Telecommunication'
            Alignment = taRightJustify
            Caption = 'BIC/SWIFT'
          end
          object LCtaEmbargo: TLFLabel
            Left = 66
            Top = 257
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Embargo'
          end
          object LTipoCuenta: TLFLabel
            Left = 57
            Top = 418
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Cuenta'
          end
          object LPaisBanco: TLFLabel
            Left = 110
            Top = 309
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pais'
          end
          object ECtaSegSocial: TLFEdit
            Left = 219
            Top = 77
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object ECtaRetencion: TLFEdit
            Left = 219
            Top = 33
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
          object ECtaRemuneracion: TLFEdit
            Left = 219
            Top = 55
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object ECtaDevengo: TLFEdit
            Left = 219
            Top = 11
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object EFCtaDevengo: TLFDBEditFind2000
            Left = 135
            Top = 11
            Width = 83
            Height = 21
            DataField = 'CTA_DEVENGO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 0
            OnChange = EFCtaDevengoChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFCtaRetencion: TLFDBEditFind2000
            Left = 135
            Top = 33
            Width = 83
            Height = 21
            DataField = 'CTA_RETENCION'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 2
            OnChange = EFCtaRetencionChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFCtaRemuneracion: TLFDBEditFind2000
            Left = 135
            Top = 55
            Width = 83
            Height = 21
            DataField = 'CTA_REMUNERACION'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 4
            OnChange = EFCtaRemuneracionChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFCtaSegSocial: TLFDBEditFind2000
            Left = 135
            Top = 77
            Width = 83
            Height = 21
            DataField = 'CTA_SEG_SOCIAL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 6
            OnChange = EFCtaSegSocialChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFCtaAnticipo: TLFDBEditFind2000
            Left = 135
            Top = 99
            Width = 83
            Height = 21
            DataField = 'CTA_ANTICIPO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 8
            OnChange = EFCtaAnticipoChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECtaAnticipo: TLFEdit
            Left = 219
            Top = 99
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 9
          end
          object ECtaSegSocialEmpresa: TLFEdit
            Left = 219
            Top = 121
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 11
          end
          object EFCtaSegSocialEmpresa: TLFDBEditFind2000
            Left = 135
            Top = 121
            Width = 83
            Height = 21
            DataField = 'CTA_SEG_SOCIAL_EMPRESA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 10
            OnChange = EFCtaSegSocialEmpresaChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBECodigoGestoria: TLFDbedit
            Left = 135
            Top = 278
            Width = 170
            Height = 21
            DataField = 'CODIGO_GESTORIA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 24
          end
          object ECtaSIngServSociales: TLFEdit
            Left = 219
            Top = 165
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 15
          end
          object ECtaRetribucionesEspecieSocios: TLFEdit
            Left = 219
            Top = 143
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBEFCtaRetribucionesEspecieSocios: TLFDBEditFind2000
            Left = 135
            Top = 143
            Width = 83
            Height = 21
            DataField = 'CTA_COBROS_ESPECIE_SOCIO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 12
            OnChange = DBEFCtaRetribucionesEspecieSociosChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCtaSIngServSociales: TLFDBEditFind2000
            Left = 135
            Top = 165
            Width = 83
            Height = 21
            DataField = 'CTA_ING_SERVICIOS_SOCIALES'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 14
            OnChange = DBEFCtaSIngServSocialesChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCtaICECES: TLFDBEditFind2000
            Left = 135
            Top = 209
            Width = 83
            Height = 21
            DataField = 'CTA_ICECES'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 18
            OnChange = DBEFCtaICECESChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECtaICECES: TLFEdit
            Left = 219
            Top = 209
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 19
          end
          object ECtaCERETA: TLFEdit
            Left = 219
            Top = 231
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 21
          end
          object DBEFCtaCERETA: TLFDBEditFind2000
            Left = 135
            Top = 231
            Width = 83
            Height = 21
            DataField = 'CTA_CE_RETA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 20
            OnChange = DBEFCtaCERETAChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCtaRetribucionEspeciaAutonomo: TLFDBEditFind2000
            Left = 135
            Top = 187
            Width = 83
            Height = 21
            DataField = 'CTA_COBROS_ESPECIE_AUTONOMO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 16
            OnChange = DBEFCtaRetribucionEspeciaAutonomoChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECtaRetribucionEspeciaAutonomo: TLFEdit
            Left = 219
            Top = 187
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 17
          end
          object DBE_B_Sucursal: TLFDbedit
            Tag = 4
            Left = 135
            Top = 349
            Width = 45
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SUCURSAL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 29
            OnChange = DBE_B_SucursalChange
          end
          object DBE_B_Cuenta: TLFDbedit
            Tag = 10
            Left = 215
            Top = 349
            Width = 345
            Height = 21
            DataField = 'CUENTA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 31
            OnChange = DBE_B_CuentaChange
          end
          object DBEFEntidad: TLFDBEditFind2000
            Tag = 4
            Left = 135
            Top = 327
            Width = 45
            Height = 21
            DataField = 'ENTIDAD'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 27
            OnChange = DBEFEntidadChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_BANCOS                     '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ENTIDAD'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFEntidadBusqueda
            OrdenadoPor.Strings = (
              'ENTIDAD')
            Filtros = []
          end
          object DBE_B_DigCont: TLFDbedit
            Tag = 2
            Left = 181
            Top = 349
            Width = 33
            Height = 21
            DataField = 'CONTROL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 30
            OnChange = DBE_B_DigContChange
          end
          object DBEBIC: TLFDbedit
            Tag = 2
            Left = 135
            Top = 393
            Width = 255
            Height = 21
            DataField = 'BIC'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 33
          end
          object DBEIBAN: TLFDbedit
            Tag = 2
            Left = 135
            Top = 371
            Width = 255
            Height = 21
            DataField = 'IBAN'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 32
            OnChange = DBEIBANChange
            OnEnter = DBEIBANEnter
          end
          object EEntidad: TLFEdit
            Left = 181
            Top = 327
            Width = 379
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 28
          end
          object DBEFCtaEmbargo: TLFDBEditFind2000
            Left = 135
            Top = 253
            Width = 83
            Height = 21
            DataField = 'CTA_EMBARGO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 22
            OnChange = DBEFCtaEmbargoChange
            OnExit = ExpandirCuentaExit
            OnKeyDown = ExpandirCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = EFOnBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECtaEmbargo: TLFEdit
            Left = 219
            Top = 253
            Width = 341
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 23
          end
          object DBEFTipoCuenta: TLFDBEditFind2000
            Tag = 4
            Left = 135
            Top = 415
            Width = 45
            Height = 21
            DataField = 'TIPO_CUENTA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 34
            OnChange = DBEFTipoCuentaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_CUENTA_BANCO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object EDescripcionTipoCuenta: TLFEdit
            Left = 181
            Top = 415
            Width = 379
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 35
          end
          object BRellenacuentasDefecto: TButton
            Left = 562
            Top = 11
            Width = 280
            Height = 21
            Hint = 'Rellena cuentas con valores por defecto'
            Caption = 'Cuentas Defecto'
            TabOrder = 36
            Visible = False
            OnClick = BRellenacuentasDefectoClick
          end
          object DBEFPaisBanco: TLFDBEditFind2000
            Tag = 4
            Left = 135
            Top = 305
            Width = 45
            Height = 21
            DataField = 'PAIS_BANCO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 25
            OnChange = DBEFPaisBancoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PAISES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PAIS'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'PAIS')
            Filtros = []
          end
          object EPaisBanco: TLFEdit
            Left = 181
            Top = 305
            Width = 379
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 26
          end
        end
        object TBNominas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1641
          Height = 25
          ButtonHeight = 21
          Caption = 'TBNominas'
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          Separators = True
          object DBETerceroNomina: TLFDbedit
            Left = 0
            Top = 2
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'EMPLEADO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBETituloTerceroNomina: TLFDbedit
            Left = 65
            Top = 2
            Width = 242
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescTercero'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object ToolButton9: TToolButton
            Left = 307
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavNominas: THYMNavigator
            Left = 315
            Top = 2
            Width = 84
            Height = 21
            DataSource = OpeDMEmpleados.DSQMEmpleados
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Ctl3D = False
            ParentCtl3D = False
            ParentShowHint = False
            PopupMenu = CENominasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = EFCtaDevengo
            Exclusivo = True
            ControlEdit = CENominas
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavNominasClickAfterAdjust
          end
        end
      end
      object TSConceptosNomina: TTabSheet [4]
        Caption = 'Conceptos Nomina'
        ImageIndex = 10
        object PNLConceptosNomina: TLFPanel
          Left = 369
          Top = 24
          Width = 1272
          Height = 545
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = PNLConceptosNominaResize
          object HYTDBGrid1: THYTDBGrid
            Left = 0
            Top = 0
            Width = 1272
            Height = 545
            Align = alClient
            Color = clInfoBk
            DataSource = OpeDMEmpleados.DSQMNomCab
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = HYTDBGrid1DblClick
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            TabFicha = TSFicha
            PermutaPaneles = True
            CamposAOrdenar.Strings = (
              'CATEGORIA'
              'CERRADO'
              'DEPARTAMENTO'
              'EMPLEADO'
              'ESTADO'
              'FECHA'
              'FECHA_COBRO'
              'FECHA_FIN_PERIODO'
              'FECHA_INI_PERIODO'
              'ID'
              'INI_CONTRATO'
              'N_SEGURIDAD_SOCIAL'
              'NIF'
              'NOMBRE_R_SOCIAL'
              'PERIODO'
              'SECCION'
              'TERCERO'
              'TITULO_PERIODO')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMPLEADO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMBRE_R_SOCIAL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PERIODO'
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_PERIODO'
                Width = 176
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_HABERES'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_DESCUENTOS'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_LIQUIDO'
                Width = 70
                Visible = True
              end>
          end
        end
        object TBConceptosNomina: TLFToolBar
          Left = 0
          Top = 0
          Width = 1641
          Height = 24
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Separators = True
          object DBETerceroConceptosNomina: TLFDbedit
            Left = 0
            Top = 2
            Width = 65
            Height = 22
            Color = clInfoBk
            DataField = 'EMPLEADO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBETituloTerceroConceptosNomina: TLFDbedit
            Left = 65
            Top = 2
            Width = 304
            Height = 22
            TabStop = False
            Color = clInfoBk
            DataField = 'DescTercero'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object PNLNominasPeriodo: TLFPanel
            Left = 369
            Top = 2
            Width = 385
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
        object PNLOtrosDatosNominas: TLFPanel
          Left = 0
          Top = 24
          Width = 369
          Height = 545
          Align = alLeft
          TabOrder = 2
          DesignSize = (
            369
            545)
          object LSueldoBase: TLFLabel
            Left = 16
            Top = 314
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Sueldo Base'
          end
          object LMovilizacion: TLFLabel
            Left = 18
            Top = 358
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Movilizaci'#243'n'
          end
          object LColacion: TLFLabel
            Left = 35
            Top = 336
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Colacion'
          end
          object LFonasa: TLFLabel
            Left = 33
            Top = 447
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'FONASA'
          end
          object LPlanIsapre: TLFLabel
            Left = 13
            Top = 424
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Plan ISAPRE'
          end
          object LIsapre: TLFLabel
            Left = 37
            Top = 402
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'ISAPRE'
          end
          object LAFP: TLFLabel
            Left = 56
            Top = 380
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'AFP'
          end
          object LFPlanISAPREUF: TLFLabel
            Left = -1246
            Top = 177
            Width = 9
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'uf'
          end
          object LTipoContrato: TLFLabel
            Left = 12
            Top = 292
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Contrato'
          end
          object LEntidadEmpleado: TLFLabel
            Left = 39
            Top = 468
            Width = 36
            Height = 13
            Caption = 'Entidad'
          end
          object LCuenta: TLFLabel
            Left = 40
            Top = 490
            Width = 34
            Height = 13
            Caption = 'Cuenta'
          end
          object LAnticipo: TLFLabel
            Left = 18
            Top = 106
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Anticipo'
          end
          object LPrestamo: TLFLabel
            Left = 12
            Top = 127
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pr'#233'stamo'
          end
          object LLeyesSociales: TLFLabel
            Left = 175
            Top = 60
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Leyes Sociales'
          end
          object LFonasaCuenta: TLFLabel
            Left = 211
            Top = 83
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fonasa'
          end
          object LMutual: TLFLabel
            Left = 24
            Top = 60
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Mutual'
          end
          object LImpuestoUnico: TLFLabel
            Left = 196
            Top = 127
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp. Unico'
          end
          object LCuentaChl: TLFLabel
            Left = 212
            Top = 38
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object DEBE: TLFLabel
            Left = 288
            Top = 16
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'HABER'
          end
          object LFLabel3: TLFLabel
            Left = 99
            Top = 16
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'DEBE'
          end
          object LDescuadre: TLFLabel
            Left = 4
            Top = 148
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descuadre'
          end
          object LGastoRemuneracion: TLFLabel
            Left = 3
            Top = 38
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gast Remu'
          end
          object LMutualEmpresa: TLFLabel
            Left = 190
            Top = 106
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Mutual Emp'
          end
          object LSeguroCesantia: TLFLabel
            Left = 1
            Top = 83
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Seguro Ces'
          end
          object LLRE: TLFLabel
            Left = 26
            Top = 512
            Width = 49
            Height = 13
            Caption = 'Cod.  LRE'
          end
          object DBESueldoBase: TLFDbedit
            Left = 79
            Top = 311
            Width = 90
            Height = 21
            DataField = 'SUELDO_BASE'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 14
          end
          object DBEMovilizacion: TLFDbedit
            Left = 79
            Top = 355
            Width = 90
            Height = 21
            DataField = 'MOVILIZACION'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 16
          end
          object DBEColacion: TLFDbedit
            Left = 79
            Top = 333
            Width = 90
            Height = 21
            DataField = 'COLACION'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 15
          end
          object DBEFonasa: TLFDbedit
            Left = 79
            Top = 444
            Width = 90
            Height = 21
            DataField = 'FONASA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 22
          end
          object DBEPlanIsapre: TLFDbedit
            Left = 79
            Top = 421
            Width = 90
            Height = 21
            DataField = 'PLAN_ISAPRE'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 21
          end
          object DBEIsapre: TLFDBEditFind2000
            Left = 79
            Top = 399
            Width = 50
            Height = 21
            DataField = 'ISAPRE'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
            OnChange = DBEIsapreChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_EQUIVALENCIAS_PREVIRED'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'GLOSA'
            CampoADevolver = 'CODIGO'
            CondicionBusqueda = 'ID_CLASIFICACION=16'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object ETituloIsapre: TLFEdit
            Left = 131
            Top = 399
            Width = 141
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 20
          end
          object ETituloAFP: TLFEdit
            Left = 131
            Top = 377
            Width = 141
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
          end
          object DBEAFP: TLFDBEditFind2000
            Left = 79
            Top = 377
            Width = 50
            Height = 21
            DataField = 'AFP'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
            OnChange = DBEAFPChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_EQUIVALENCIAS_PREVIRED'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'GLOSA'
            CampoADevolver = 'CODIGO'
            CondicionBusqueda = 'ID_CLASIFICACION=10'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBCHKGratificacion: TLFDBCheckBox
            Left = 79
            Top = 266
            Width = 193
            Height = 17
            Caption = 'Gratificaci'#243'n S/N'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GENERA_GRATIFICACION'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ETipoContrato: TLFEdit
            Left = 131
            Top = 289
            Width = 141
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBETipoContrato: TLFDBEditFind2000
            Left = 79
            Top = 289
            Width = 50
            Height = 21
            DataField = 'TIPO_CONTRATO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
            OnChange = DBETipoContratoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_SYS_TIPOS_CONTRATOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
            CampoADevolver = 'TIPO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEEntidadEmpleado: TLFDBEditFind2000
            Left = 79
            Top = 466
            Width = 50
            Height = 21
            DataField = 'ENTIDAD'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 23
            OnChange = DBEEntidadEmpleadoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_BANCOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ENTIDAD'
            CampoStr = 'TITULO'
            CampoADevolver = 'ENTIDAD'
            CondicionBusqueda = 'PAIS='#39'CHL'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBECuenta: TLFDbedit
            Left = 79
            Top = 488
            Width = 193
            Height = 21
            DataField = 'CUENTA'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 25
          end
          object DBEEntidadEmpleadoTitulo: TLFEdit
            Left = 131
            Top = 466
            Width = 141
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
          end
          object DBECuentaChl: TLFDBEditFind2000
            Left = 251
            Top = 35
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CTA_CUENTA_CHL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 1
            OnDblClick = DBECuentaChlDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEAnticipo: TLFDBEditFind2000
            Left = 61
            Top = 101
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CTA_ANTICIPO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 6
            OnDblClick = DBECuentaChlDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEPrestamo: TLFDBEditFind2000
            Left = 61
            Top = 123
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CTA_PRESTAMO_CHL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 8
            OnDblClick = DBECuentaChlDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBELeyesSociales: TLFDBEditFind2000
            Left = 251
            Top = 57
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CTA_LEYES_SOCIALES_CHL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 3
            OnDblClick = DBECuentaChlDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFonasaCuemta: TLFDBEditFind2000
            Left = 251
            Top = 79
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CTA_FONASA_CHL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 5
            OnDblClick = DBECuentaChlDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFMutual: TLFDBEditFind2000
            Left = 61
            Top = 57
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CTA_MUTUAL_CHL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 2
            OnDblClick = DBECuentaChlDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFImpuestoUnico: TLFDBEditFind2000
            Left = 251
            Top = 123
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CTA_IMPUESTO_UNICO_CHL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 9
            OnDblClick = DBECuentaChlDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBELDescuadre: TLFDBEditFind2000
            Left = 61
            Top = 145
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CTA_DESCUADRE_CHL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 10
            OnDblClick = DBECuentaChlDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEGastoRemuneracion: TLFDBEditFind2000
            Left = 61
            Top = 35
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CTA_GASTO_REMUNERACION_CHL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 0
            OnDblClick = DBECuentaChlDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEMutualEmpresa: TLFDBEditFind2000
            Left = 251
            Top = 101
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CTA_MUTUAL_EMPRESA_CHL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 7
            OnDblClick = DBECuentaChlDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBESeguroCesantia: TLFDBEditFind2000
            Left = 61
            Top = 79
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CTA_SEGURO_CESANTIA_CHL'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 4
            OnDblClick = DBECuentaChlDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ELRETitulo: TLFEdit
            Left = 129
            Top = 510
            Width = 141
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 26
            Text = 'ELRETitulo'
          end
          object DBELRE: TLFDBEditFind2000
            Left = 80
            Top = 510
            Width = 50
            Height = 21
            DataField = 'LRE'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            TabOrder = 27
            OnChange = DBELREChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_POBLACION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'LRE'
            CampoStr = 'TITULO'
            CampoADevolver = 'LRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1641
          Height = 569
          DataSource = OpeDMEmpleados.DSQMEmpleados
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'ACTIVO'
            'APTO'
            'MINUSVALIA')
          CamposChecked.Strings = (
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'APELLIDO_MATERNO'
            'APELLIDO_PATERNO'
            'APTO'
            'BANCO'
            'BIC'
            'CALENDARIO'
            'CATEGORIA'
            'CENTRO'
            'CLIENTE'
            'CODIGO_GESTORIA'
            'CODIGO_POSTAL'
            'CODIGO_TARJETA'
            'CONTACTO_NOMBRE'
            'CONTACTO_PARENTESCO'
            'CONTACTO_TELEFONO'
            'CONTRATO_SUSPENDIDO'
            'CONTROL'
            'CTA_ANTICIPO'
            'CTA_CE_RETA'
            'CTA_COBROS_ESPECIE_AUTONOMO'
            'CTA_COBROS_ESPECIE_SOCIO'
            'CTA_DEVENGO'
            'CTA_EMBARGO'
            'CTA_ICECES'
            'CTA_ING_SERVICIOS_SOCIALES'
            'CTA_REMUNERACION'
            'CTA_RETENCION'
            'CTA_SEG_SOCIAL'
            'CTA_SEG_SOCIAL_EMPRESA'
            'CUENTA'
            'DEPARTAMENTO'
            'DIR_BLOQUE_ESCALERA'
            'DIR_LOCALIDAD'
            'DIR_NOMBRE'
            'DIR_NOMBRE_2'
            'DIR_NOMBRE_3'
            'DIR_NUMERO'
            'DIR_PISO'
            'DIR_PUERTA'
            'DIR_TIPO'
            'DIRECCION'
            'DIRECCION_CLIENTE'
            'EMAIL'
            'EMPLEADO'
            'ENTIDAD'
            'ESTADO_CIVIL'
            'FEC_ULTIMA_LLAMADA'
            'FECHA_INGRESO'
            'FECHA_NACIMIENTO'
            'FIN_CONTRATO'
            'GENERO'
            'HORARIO'
            'IBAN'
            'ID_EMPLEADO'
            'IMPUTACION'
            'INI_CONTRATO'
            'MINUSVALIA'
            'N_SEGURIDAD_SOCIAL'
            'NACIONALIDAD'
            'NIF'
            'NOMBRE'
            'PAIS'
            'PAIS_TERCERO'
            'PROVINCIA'
            'PROYECTO'
            'RECURSO'
            'REPAR_EMPRESA_DST'
            'REPAR_SERIE_DST'
            'SECCION'
            'SUCURSAL'
            'SUSPENCION_CONTRATO'
            'TELEFONO01'
            'TELEFONO02'
            'TERCERO'
            'TERCERO_CLIENTE'
            'TIPO_CONTRATO'
            'TIPO_DOC_IDENT'
            'TIPOIMPUTACION'
            'TIPOTAREA'
            'TITULO'
            'TITULO_LOCALIDAD'
            'USUARIO')
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPLEADO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TERCERO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 244
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CATEGORIA'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CENTRO'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEPARTAMENTO'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SECCION'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALENDARIO'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'N_SEGURIDAD_SOCIAL'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_CONTRATO'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INI_CONTRATO'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FIN_CONTRATO'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_NACIMIENTO'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_CIVIL'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_TARJETA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_EMPLEADO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NIF'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONO01'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FEC_ULTIMA_LLAMADA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 55
              Visible = True
            end>
        end
      end
      object TSSecciones: TTabSheet
        Caption = 'Secciones'
        ImageIndex = 5
        object TBSecciones: TLFToolBar
          Left = 0
          Top = 0
          Width = 1641
          Height = 25
          ButtonHeight = 21
          Caption = 'TBNominas'
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 0
          Separators = True
          object DBETerceroSecciones: TLFDbedit
            Left = 0
            Top = 2
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'EMPLEADO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBETituloTerceroSecciones: TLFDbedit
            Left = 65
            Top = 2
            Width = 242
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescTercero'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object ToolButton10: TToolButton
            Left = 307
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavSecciones: THYMNavigator
            Left = 315
            Top = 2
            Width = 220
            Height = 21
            DataSource = OpeDMEmpleados.DSSecciones
            Ctl3D = False
            ParentCtl3D = False
            ParentShowHint = False
            PopupMenu = CENominasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFSecciones
            InsertaControl = DBGFSecciones
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLSecciones: TLFPanel
          Left = 0
          Top = 25
          Width = 1641
          Height = 544
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFSecciones: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 1641
            Height = 544
            Align = alClient
            DataSource = OpeDMEmpleados.DSSecciones
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            IniStorage = FSMain
            Insercion = True
            ColumnaInicial = 0
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            Transaction = OpeDMEmpleados.TLocal
            BuscarNums = False
            Campos.Strings = (
              'SECCION')
            CamposAMostrar.Strings = (
              'SECCION'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            Numericos.Strings = (
              'SECCION')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'OPE_SECCIONES')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'DESCRIPCION')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'SECCION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'SECCION'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DESCRIPCION'
                ReadOnly = True
                Width = 489
                Visible = True
              end>
          end
        end
      end
      object TSHorasCompensar: TTabSheet
        Caption = 'Horas Compensar'
        ImageIndex = 6
        object TBHorasCompensar: TLFToolBar
          Left = 0
          Top = 0
          Width = 1641
          Height = 25
          ButtonHeight = 21
          Caption = 'TBNominas'
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 0
          Separators = True
          object DBETerceroHorasCompensar: TLFDbedit
            Left = 0
            Top = 2
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'EMPLEADO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEDescTereroHorasCompensar: TLFDbedit
            Left = 65
            Top = 2
            Width = 242
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescTercero'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object TBSep1: TToolButton
            Left = 307
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavHorasCompensar: THYMNavigator
            Left = 315
            Top = 2
            Width = 220
            Height = 21
            DataSource = OpeDMEmpleados.DSxHorasCompensar
            Ctl3D = False
            ParentCtl3D = False
            ParentShowHint = False
            PopupMenu = CENominasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFHorasCompensar
            InsertaControl = DBGFHorasCompensar
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLHorasCompensarFechaIni: TLFPanel
            Left = 535
            Top = 2
            Width = 194
            Height = 21
            BevelOuter = bvNone
            TabOrder = 3
            object LHorasCompensarFechaIni: TLFLabel
              Left = 19
              Top = 3
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Ini:'
            end
            object DEHorasCompensarFechaIni: TLFDateEdit
              Left = 72
              Top = 0
              Width = 121
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
              OnChange = DEHorasCompensarFechaIniChange
            end
          end
        end
        object PNLHorasCompensar: TLFPanel
          Left = 0
          Top = 25
          Width = 1641
          Height = 544
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFHorasCompensar: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 1641
            Height = 544
            Align = alClient
            DataSource = OpeDMEmpleados.DSxHorasCompensar
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            IniStorage = FSMain
            Insercion = True
            ColumnaInicial = 0
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            Transaction = OpeDMEmpleados.TLocal
            BuscarNums = False
            Campos.Strings = (
              'SECCION')
            CamposAMostrar.Strings = (
              'SECCION'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            Numericos.Strings = (
              'SECCION')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'OPE_SECCIONES')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'DESCRIPCION')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'SECCION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ID'
                ReadOnly = True
                Width = 50
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
                FieldName = 'HORAS'
                Width = 72
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SALDO_HORAS'
                ReadOnly = True
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMENTARIO'
                Width = 400
                Visible = True
              end>
          end
        end
      end
      object TSImputaciones: TTabSheet
        Caption = 'Imputaciones'
        ImageIndex = 7
        object PNLImputaciones: TLFPanel
          Left = 0
          Top = 0
          Width = 1641
          Height = 569
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBImputaciones: TLFToolBar
            Left = 0
            Top = 0
            Width = 1641
            Height = 24
            ButtonHeight = 21
            EdgeInner = esNone
            EdgeOuter = esNone
            TabOrder = 0
            Separators = True
            object DBEEmpleadoImputaciones: TLFDbedit
              Left = 0
              Top = 2
              Width = 65
              Height = 21
              Color = clInfoBk
              DataField = 'EMPLEADO'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEDescEmpleadoImputaciones: TLFDbedit
              Left = 65
              Top = 2
              Width = 242
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DescTercero'
              DataSource = OpeDMEmpleados.DSQMEmpleados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object TBSep2: TToolButton
              Left = 307
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object NavImputaciones: THYMNavigator
              Left = 315
              Top = 2
              Width = 200
              Height = 21
              DataSource = OpeDMEmpleados.DSQMDetalle
              Flat = True
              ParentShowHint = False
              PopupMenu = CEDetallePMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFImputaciones
              InsertaControl = DBGFImputaciones
              Exclusivo = True
              ControlEdit = CEDetalle
              OrdenAscendente = True
              InsertaUltimo = True
            end
          end
          object DBGFImputaciones: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 1641
            Height = 545
            Align = alClient
            DataSource = OpeDMEmpleados.DSQMDetalle
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 1
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'IMPUTACION')
            CamposAMostrar.Strings = (
              'IMPUTACION'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'IMPORTE'
              'IMPUTACION'
              'DESCRIPCION'
              'ACTIVO')
            ColumnasCheckBoxes.Strings = (
              'ACTIVO'
              'Horas')
            ColumnasChecked.Strings = (
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'IMPUTACION')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'OPE_SYS_IMPUTACION')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'DESCRIPCION')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = False
            OrdenadosPor.Strings = (
              '')
            Filtros = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA'
                ReadOnly = True
                Width = 41
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IMPUTACION'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRIPCION'
                Width = 221
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IMPORTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_INI'
                Width = 97
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_FIN'
                ReadOnly = True
                Width = 96
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'HORAS'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ACTIVO'
                Visible = True
              end>
          end
        end
      end
      object TSContratos: TTabSheet
        Caption = 'Contratos'
        ImageIndex = 8
        object PNLContratos: TLFPanel
          Left = 0
          Top = 24
          Width = 1641
          Height = 545
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGContratos: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 1641
            Height = 545
            Align = alClient
            DataSource = OpeDMEmpleados.DSxContratos
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            IniStorage = FSMain
            Insercion = True
            ColumnaInicial = 1
            UsaDicG2K = False
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
            Transaction = OpeDMEmpleados.TLocal
            BuscarNums = False
            Campos.Strings = (
              'TIPO_CONTRATO'
              'CODIGO_FINALIZACION_CHL')
            CamposAMostrar.Strings = (
              'TIPO_CONTRATO'
              '1'
              'TIPO'
              'CODIGO_FINALIZACION_CHL'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'ACTIVO'
              'CONTRATO'
              'DIAS_CONTRATO'
              'FECHA_AVISO_FIN'
              'FECHA_FIN_CONTRATO'
              'FECHA_INICIO_CONTRATO'
              'NUM_CONTRATO'
              'TIPO_CONTRATO'
              'FECHA_SUSPENCION_CONTRATO'
              'SUSPENDIDO')
            ColumnasCheckBoxes.Strings = (
              'ACTIVO'
              'SUSPENDIDO')
            ColumnasChecked.Strings = (
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'TIPO'
              'CODIGO')
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tablas.Strings = (
              'OPE_SYS_TIPOS_CONTRATOS'
              'SYS_MOTIVO_BAJA_CONTRATO_CHL')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'DESCRIPCION'
              'DESCRIPCION')
            Posicion = tpCentrado
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'TIPO'
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CONTRATO'
                ReadOnly = True
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_CONTRATO'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_INICIO_CONTRATO'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_SUSPENCION_CONTRATO'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUSPENDIDO'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_FIN_CONTRATO'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_AVISO_FIN'
                Width = 72
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
                FieldName = 'TIPO_CONTRATO'
                Width = 70
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DESC_TIPO_CONTRATO'
                Width = 250
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DIAS_CONTRATO'
                ReadOnly = True
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO_FINALIZACION_CHL'
                Title.Caption = 'Motivo de Retiro'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DESC_MOTIVO_FINALIZACION'
                ReadOnly = True
                Title.Caption = 'Causa de Retiro'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOTIVO_FINALIZACION'
                Width = 350
                Visible = True
              end>
          end
        end
        object TBContratos: TLFToolBar
          Left = 0
          Top = 0
          Width = 1641
          Height = 24
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          Separators = True
          object DBEEmpleadoContratos: TLFDbedit
            Left = 0
            Top = 2
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'EMPLEADO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEDescTerceroContratos: TLFDbedit
            Left = 65
            Top = 2
            Width = 242
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescTercero'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object TBSep3: TToolButton
            Left = 307
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavContratos: THYMNavigator
            Left = 315
            Top = 2
            Width = 200
            Height = 21
            DataSource = OpeDMEmpleados.DSxContratos
            Flat = True
            ParentShowHint = False
            PopupMenu = CEContratosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGContratos
            InsertaControl = DBGContratos
            Exclusivo = True
            ControlEdit = CEContratos
            OrdenAscendente = True
            InsertaUltimo = True
          end
        end
      end
      object TSIncapacidadTransitoria: TTabSheet
        Caption = 'Ausencias'
        ImageIndex = 9
        object TBContratos1: TLFToolBar
          Left = 0
          Top = 0
          Width = 1641
          Height = 24
          ButtonHeight = 21
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 0
          Separators = True
          object DBEIncapacidadTransitoriaEmpleado: TLFDbedit
            Left = 0
            Top = 2
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'EMPLEADO'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEIncapacidadTransitoriaDescTercero: TLFDbedit
            Left = 65
            Top = 2
            Width = 242
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescTercero'
            DataSource = OpeDMEmpleados.DSQMEmpleados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object TBSep32: TToolButton
            Left = 307
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavIncapacidadTransitoria: THYMNavigator
            Left = 315
            Top = 2
            Width = 200
            Height = 21
            DataSource = OpeDMEmpleados.DSxIncapacidadTransitoria
            Flat = True
            ParentShowHint = False
            PopupMenu = CEIncapacidadTransitoriaPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGIncapacidadTransitoria
            InsertaControl = DBGIncapacidadTransitoria
            Exclusivo = True
            ControlEdit = CEIncapacidadTransitoria
            OrdenAscendente = True
            InsertaUltimo = True
            OnClickAfterAdjust = NavIncapacidadTransitoriaClickAfterAdjust
          end
        end
        object PNLIncapacidadTransitoria: TLFPanel
          Left = 0
          Top = 24
          Width = 1641
          Height = 545
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter1: TSplitter
            Left = 857
            Top = 0
            Width = 8
            Height = 545
            Cursor = crHSplit
          end
          object DBGIncapacidadTransitoria: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 857
            Height = 545
            Align = alLeft
            DataSource = OpeDMEmpleados.DSxIncapacidadTransitoria
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGIncapacidadTransitoriaDrawColumnCell
            IniStorage = FSMain
            Insercion = True
            ColumnaInicial = 1
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            Transaction = OpeDMEmpleados.TLocal
            BuscarNums = False
            Campos.Strings = (
              'TIPO')
            CamposAMostrar.Strings = (
              'TIPO'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            Numericos.Strings = (
              'TIPO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_TIPO_INCAP_TRANSITORIA')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_INICIO'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_FIN'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO'
                Width = 40
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMENTARIO'
                Width = 350
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_SECUENCIA_FIE'
                Width = 100
                Visible = True
              end>
          end
          object PNLIncapacidad: TLFPanel
            Left = 865
            Top = 0
            Width = 776
            Height = 545
            Align = alClient
            TabOrder = 1
            object TBIncapacidad: TLFToolBar
              Left = 1
              Top = 1
              Width = 774
              Height = 29
              ButtonHeight = 25
              Caption = 'TBIncapacidad'
              TabOrder = 0
              Separators = True
              object NavIncapacidad: THYMNavigator
                Left = 0
                Top = 2
                Width = 240
                Height = 25
                DataSource = OpeDMEmpleados.DSQMIncapacidad
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
            object DBGIncapacidad: TDBGridFind2000
              Left = 1
              Top = 30
              Width = 774
              Height = 514
              Align = alClient
              Ctl3D = True
              DataSource = OpeDMEmpleados.DSQMIncapacidad
              ParentCtl3D = False
              TabOrder = 1
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
              AutoCambiarColumna = True
              AutoPostEnCheckBox = False
              AutoStartDrag = False
              AutoStartDragInterval = 0
              IndiceBitmapOrdenable = 0
              IndiceBitmapAscendente = 0
              IndiceBitmapChecked = -1
              IndiceBitmapDescendente = 0
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              BuscarChars = False
              Campos.Strings = (
                'PARAMETRO_AUS')
              CamposAMostrar.Strings = (
                'PARAMETRO_AUS'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0')
              CamposADevolver.Strings = (
                'CODIGO')
              CamposDesplegar.Strings = (
                '1')
              CampoAOrdenarColor = clInfoBk
              CondicionBusqueda = '(CODIGO='#39'P001'#39' OR CODIGO='#39'P002'#39')'
              MensajeNoExiste = False
              Numericos.Strings = (
                'CODIGO')
              SalirSiVacio = True
              SalirSiNoExiste = True
              Tablas.Strings = (
                'EMP_CONCEPTO_PARAMETROS')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'GLOSA')
              Posicion = tpCentrado
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'CODIGO')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PARAMETRO_AUS'
                  Width = 60
                  Visible = True
                end>
            end
          end
          object DEFechaIni: TLFDateEdit
            Left = 520
            Top = 128
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
            Visible = False
            OnChange = DEFechaIniChange
          end
          object DEFechaFin: TLFDateEdit
            Left = 656
            Top = 128
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
            Visible = False
            OnChange = DEFechaFinChange
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 627
    Width = 1653
  end
  inherited CEMain: TControlEdit
    FichaEdicion = nil
    FichaExclusiva = nil
    Left = 364
    Top = 348
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 396
    Top = 348
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 328
    Top = 296
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listado'
      Caption = 'Listado'
      ImageIndex = 14
    end
    object AListadoEmpleados: TAction
      Category = 'Listado'
      Caption = 'Listado de Empleados'
      ImageIndex = 14
      OnExecute = AListadoEmpleadosExecute
    end
    object ALstFormacion: TAction
      Category = 'Listado'
      Caption = 'Listado de Formaci'#243'n'
      ImageIndex = 14
      OnExecute = ALstFormacionExecute
    end
    object ALstEtiqueta: TAction
      Category = 'Listado'
      Caption = 'Listado de Etiquetas'
      ImageIndex = 95
      OnExecute = ALstEtiquetaExecute
    end
    object ALstCodBarrasEmpl: TAction
      Category = 'Listado'
      Caption = 'Listado de c'#243'digo de barras'
      ImageIndex = 38
      OnExecute = ALstCodBarrasEmplExecute
    end
    object ALstResumen: TAction
      Category = 'Listado'
      Caption = 'Resumen Listado Empleados'
      ImageIndex = 14
      OnExecute = ALstResumenExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listado;ListadoConf'
      Caption = 'Configuraci'#243'n Listados'
      ImageIndex = 77
    end
    object ALstConfig: TAction
      Category = 'Listado;ListadoConf'
      Caption = 'Configuraci'#243'n Listado Empleado'
      ImageIndex = 77
      OnExecute = ALstConfigExecute
    end
    object ALstConfigFor: TAction
      Category = 'Listado;ListadoConf'
      Caption = 'Configuraci'#243'n Listado Formaci'#243'n'
      ImageIndex = 77
      OnExecute = ALstConfigForExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AMarcajes: TAction
      Category = 'Procesos'
      Caption = 'Ver Marcajes Operario'
      Hint = 'Ver marcajes operario'
      ImageIndex = 105
      OnExecute = AMarcajesExecute
    end
    object ADocumentos: TAction
      Category = 'Procesos'
      Caption = 'Documentos de empleados'
      Hint = 'Documentos de empleados'
      ImageIndex = 87
      OnExecute = ADocumentosExecute
    end
    object ALstResumenEmpleados: TAction
      Category = 'Listado;ListadoConf'
      Caption = 'Configuraci'#243'n Resumen Empleados'
      ImageIndex = 77
      OnExecute = ALstResumenEmpleadosExecute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Filtros'
      Caption = 'Filtros'
      ImageIndex = 5
    end
    object AFiltroTodos: TAction
      Category = 'Filtros'
      Caption = 'Quitar Filtro'
      Hint = 'Quita todos los filtros'
      ImageIndex = 5
      OnExecute = AFiltroTodosExecute
    end
    object AFiltroInactivos: TAction
      Category = 'Filtros'
      Caption = 'No Activos'
      Hint = 'Filtra empeados de no activos'
      ImageIndex = 5
      OnExecute = AFiltroInactivosExecute
    end
    object AFiltroActivos: TAction
      Category = 'Filtros'
      Caption = 'Activos'
      Hint = 'Filtra empeados activos'
      ImageIndex = 5
      OnExecute = AFiltroActivosExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Tercero'
      Hint = 'Adjuntos del Tercero'
      ImageIndex = 59
      OnExecute = AAdjuntosTerceroExecute
    end
    object AAdjuntosEmpleado: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Empleado'
      Hint = 'Adjuntos del Empleado'
      ImageIndex = 59
      OnExecute = AAdjuntosEmpleadoExecute
    end
    object AImportaAusenciasFIE: TAction
      Category = 'Procesos'
      Caption = 'Importa Ausencias'
      ImageIndex = 6
      OnExecute = AImportaAusenciasFIEExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 366
    Top = 282
  end
  object CENotas: TControlEdit
    EnlazadoA = CEFormacionOpe
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLNotas
    Complementario = TBMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 368
    Top = 382
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 397
    Top = 382
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEListados: TPopupMenu
    AutoHotkeys = maManual
    Left = 403
    Top = 248
    object Fichaempleado1: TMenuItem
      Caption = 'Ficha empleado'
      OnClick = Fichaempleado1Click
    end
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEContratos
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 364
    Top = 312
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 396
    Top = 312
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
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEFormacionOpe: TControlEdit
    EnlazadoA = CENominas
    FichaEdicion = TSFormacion
    FichaExclusiva = TSFormacion
    PanelEdicion = LFPFormacionDatos
    PopUpMenu = CEFormacionOpePMEdit
    Teclas = DMMain.Teclas
    Left = 368
    Top = 420
  end
  object CEFormacionOpePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 400
    Top = 420
    object CEFormacionOpeMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEFormacionOpeMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEFormacionOpeMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEFormacionOpeMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEFormacionOpeMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEFormacionOpeMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEFormacionOpeMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEFormacionOpeMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEFormacionOpeMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEFormacionOpeMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECursos: TControlEdit
    FichaEdicion = TSFormacion
    FichaExclusiva = TSFormacion
    PopUpMenu = CECursosPMEdit
    Teclas = DMMain.Teclas
    Left = 368
    Top = 456
  end
  object CECursosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 400
    Top = 456
    object CECursosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECursosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECursosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECursosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECursosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CECursosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CECursosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CECursosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CECursosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CECursosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ALEmpleados: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 328
    Top = 256
  end
  object CENominas: TControlEdit
    DataSource = OpeDMEmpleados.DSQMEmpleados
    EnlazadoA = CEDetalle
    FichaEdicion = TSNomina
    FichaExclusiva = TSNomina
    PanelEdicion = PNLCuentas
    PopUpMenu = CENominasPMEdit
    Teclas = DMMain.Teclas
    Left = 368
    Top = 488
  end
  object CENominasPMEdit: TPopUpTeclas
    Left = 400
    Top = 488
    object CENominasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CENominasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CENominasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CENominasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CENominasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CENominasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CENominasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENominasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENominasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENominasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEContratos: TControlEdit
    EnlazadoA = CEIncapacidadTransitoria
    FichaEdicion = TSContratos
    PopUpMenu = CEContratosPMEdit
    Teclas = DMMain.Teclas
    Left = 368
    Top = 520
  end
  object CEContratosPMEdit: TPopUpTeclas
    Left = 400
    Top = 520
    object CEContratosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEContratosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEContratosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEContratosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEContratosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEContratosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEContratosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEContratosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEContratosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEContratosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEIncapacidadTransitoria: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CEIncapacidadTransitoriaPMEdit
    Teclas = DMMain.Teclas
    Left = 368
    Top = 552
  end
  object CEIncapacidadTransitoriaPMEdit: TPopUpTeclas
    Left = 400
    Top = 552
    object CEIncapacidadTransitoriaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEIncapacidadTransitoriaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEIncapacidadTransitoriaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEIncapacidadTransitoriaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEIncapacidadTransitoriaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEIncapacidadTransitoriaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEIncapacidadTransitoriaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEIncapacidadTransitoriaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEIncapacidadTransitoriaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEIncapacidadTransitoriaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
