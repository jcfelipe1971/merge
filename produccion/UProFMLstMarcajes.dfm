inherited ProFMLstMarcajes: TProFMLstMarcajes
  Left = 384
  Top = 331
  Caption = 'Listado de Marcajes'
  ClientHeight = 341
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 275
    inherited PCMain: TLFPageControl
      Top = 77
      Height = 198
      ActivePage = TSOperario
      TabIndex = 0
      OnChange = PCMainChange
      object TSOperario: TTabSheet
        Caption = 'Operario'
        object Panel5: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 170
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LClienteD: TLFLabel
            Left = 21
            Top = 15
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Operario'
          end
          object LClienteH: TLFLabel
            Left = 24
            Top = 38
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Operario'
          end
          object LabelOrdenD: TLFLabel
            Left = 21
            Top = 109
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde IDOrden'
          end
          object LabelOrdenH: TLFLabel
            Left = 190
            Top = 109
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta IDOrden'
          end
          object LabelFaseD: TLFLabel
            Left = 38
            Top = 130
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fase'
          end
          object LabelFaseH: TLFLabel
            Left = 207
            Top = 130
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fase'
          end
          object LabelTareaD: TLFLabel
            Left = 33
            Top = 151
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Tarea'
          end
          object LabelTareaH: TLFLabel
            Left = 202
            Top = 151
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Tarea'
          end
          object LabelIDTarea: TLFLabel
            Left = 22
            Top = 86
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde IDTarea'
          end
          object LabelIDTareaH: TLFLabel
            Left = 191
            Top = 87
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta IDTarea'
          end
          object LCompuestoD: TLFLabel
            Left = 8
            Top = 64
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Compuesto'
          end
          object LCompuestoH: TLFLabel
            Left = 177
            Top = 65
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Compuesto'
          end
          object EOperarioD: TLFEdit
            Left = 164
            Top = 11
            Width = 356
            Height = 21
            TabStop = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object EOperarioH: TLFEdit
            Left = 164
            Top = 33
            Width = 356
            Height = 21
            TabStop = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object EFOrdenH: TLFEditFind2000
            Left = 265
            Top = 104
            Width = 76
            Height = 21
            TabOrder = 9
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ID_ORDEN'
            CampoStr = 'COMPUESTO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_ORD'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ID_ORDEN')
            Filtros = []
          end
          object EFFaseD: TLFEditFind2000
            Left = 99
            Top = 126
            Width = 76
            Height = 21
            TabOrder = 10
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FASE')
            Filtros = []
          end
          object EFFaseH: TLFEditFind2000
            Left = 265
            Top = 126
            Width = 76
            Height = 21
            TabOrder = 11
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FASE')
            Filtros = []
          end
          object EFTareaD: TLFEditFind2000
            Left = 99
            Top = 148
            Width = 76
            Height = 21
            TabOrder = 12
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TAREA')
            Filtros = []
          end
          object EFTareaH: TLFEditFind2000
            Left = 265
            Top = 148
            Width = 76
            Height = 21
            TabOrder = 13
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TAREA')
            Filtros = []
          end
          object EFOperarioD: TLFEditFind2000
            Left = 99
            Top = 11
            Width = 64
            Height = 21
            TabOrder = 0
            OnChange = EFOperarioDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFOrdenD: TLFEditFind2000
            Left = 99
            Top = 104
            Width = 76
            Height = 21
            TabOrder = 8
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ID_ORDEN'
            CampoStr = 'COMPUESTO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_ORD'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ID_ORDEN')
            Filtros = []
          end
          object EFOperarioH: TLFEditFind2000
            Left = 99
            Top = 33
            Width = 64
            Height = 21
            TabOrder = 2
            OnChange = EFOperarioHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFIDTareaD: TLFEditFind2000
            Left = 99
            Top = 82
            Width = 76
            Height = 21
            TabOrder = 6
            OnChange = EFIDTareaDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'IDENTIFICADOR'
            CampoStr = 'TAREA'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_ORD_TAREA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'IDENTIFICADOR')
            Filtros = []
          end
          object EFIDTareaH: TLFEditFind2000
            Left = 265
            Top = 82
            Width = 76
            Height = 21
            TabOrder = 7
            OnChange = EFIDTareaHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'IDENTIFICADOR'
            CampoStr = 'TAREA'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_ORD_TAREA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'IDENTIFICADOR')
            Filtros = []
          end
          object RGTipoLst: TRadioGroup
            Left = 352
            Top = 58
            Width = 142
            Height = 82
            Caption = 'Tipo de Listado'
            ItemIndex = 0
            Items.Strings = (
              'Por Operario'
              'Por Fase')
            TabOrder = 14
            OnClick = RGTipoLstClick
          end
          object LFCompuestoD: TLFEditFind2000
            Left = 99
            Top = 60
            Width = 76
            Height = 21
            TabOrder = 3
            OnChange = LFCompuestoDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'COMPUESTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFCompuestoH: TLFEditFind2000
            Left = 265
            Top = 60
            Width = 76
            Height = 21
            TabOrder = 4
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'COMPUESTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TSMaquina: TTabSheet
        Caption = 'M'#225'quina'
        ImageIndex = 1
        object Panel4: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 170
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LMaquinaD: TLFLabel
            Left = 12
            Top = 15
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde M'#225'quina'
          end
          object LMaquinaH: TLFLabel
            Left = 15
            Top = 38
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta M'#225'quina'
          end
          object Label4: TLFLabel
            Left = 24
            Top = 93
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Orden'
          end
          object Label5: TLFLabel
            Left = 30
            Top = 115
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fase'
          end
          object Label6: TLFLabel
            Left = 25
            Top = 136
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Tarea'
          end
          object Label7: TLFLabel
            Left = 237
            Top = 93
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Orden'
          end
          object Label8: TLFLabel
            Left = 243
            Top = 115
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fase'
          end
          object Label9: TLFLabel
            Left = 238
            Top = 136
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Tarea'
          end
          object Label27: TLFLabel
            Left = 213
            Top = 71
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Compuesto'
          end
          object Label26: TLFLabel
            Left = 0
            Top = 71
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Compuesto'
          end
          object DBEArticuloD: TLFDbedit
            Left = 156
            Top = 11
            Width = 356
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = ProDMLstMarcajes.DSxMaquinaD
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEArticuloH: TLFDbedit
            Left = 156
            Top = 33
            Width = 356
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = ProDMLstMarcajes.DSxMaquinaH
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object EFMaquinaD: TLFEditFind2000
            Left = 91
            Top = 11
            Width = 64
            Height = 21
            TabOrder = 0
            OnChange = EFMaquinaDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CODMAQ')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFMaquinaH: TLFEditFind2000
            Left = 91
            Top = 33
            Width = 64
            Height = 21
            TabOrder = 1
            OnChange = EFMaquinaHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CODMAQ')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFOrdenMaqD: TLFEditFind2000
            Left = 91
            Top = 89
            Width = 64
            Height = 21
            TabOrder = 6
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ID_ORDEN'
            CampoStr = 'COMPUESTO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_ORD'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ID_ORDEN')
            Filtros = []
          end
          object EFFaseMaqD: TLFEditFind2000
            Left = 91
            Top = 111
            Width = 64
            Height = 21
            TabOrder = 8
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FASE')
            Filtros = []
          end
          object EFTareaMaqD: TLFEditFind2000
            Left = 91
            Top = 133
            Width = 64
            Height = 21
            TabOrder = 10
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TAREA')
            Filtros = []
          end
          object EFOrdenMaqH: TLFEditFind2000
            Left = 301
            Top = 89
            Width = 64
            Height = 21
            TabOrder = 7
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ID_ORDEN'
            CampoStr = 'COMPUESTO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_ORD'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ID_ORDEN')
            Filtros = []
          end
          object EFFaseMaqH: TLFEditFind2000
            Left = 301
            Top = 111
            Width = 64
            Height = 21
            TabOrder = 9
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FASE')
            Filtros = []
          end
          object EFTareaMaqH: TLFEditFind2000
            Left = 301
            Top = 133
            Width = 64
            Height = 21
            TabOrder = 11
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TAREA')
            Filtros = []
          end
          object LFCompuestoMaqD: TLFEditFind2000
            Left = 91
            Top = 67
            Width = 105
            Height = 21
            TabOrder = 2
            OnChange = LFCompuestoMaqDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'COMPUESTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFCompuestoMaqH: TLFEditFind2000
            Left = 301
            Top = 67
            Width = 105
            Height = 21
            TabOrder = 3
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'COMPUESTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TSTrabExt: TTabSheet
        Caption = 'Trab. Exterior'
        ImageIndex = 2
        object Panel3: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 170
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label10: TLFLabel
            Left = 4
            Top = 15
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Proveedor'
          end
          object Label11: TLFLabel
            Left = 7
            Top = 37
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Proveedor'
          end
          object Label12: TLFLabel
            Left = 237
            Top = 93
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Orden'
          end
          object Label13: TLFLabel
            Left = 243
            Top = 115
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fase'
          end
          object Label14: TLFLabel
            Left = 238
            Top = 136
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Tarea'
          end
          object Label15: TLFLabel
            Left = 25
            Top = 136
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Tarea'
          end
          object Label16: TLFLabel
            Left = 30
            Top = 115
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fase'
          end
          object Label17: TLFLabel
            Left = 24
            Top = 93
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Orden'
          end
          object Label24: TLFLabel
            Left = 213
            Top = 71
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Compuesto'
          end
          object Label25: TLFLabel
            Left = 0
            Top = 71
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Compuesto'
          end
          object EFProveedorH: TLFEditFind2000
            Left = 91
            Top = 33
            Width = 64
            Height = 21
            TabOrder = 1
            OnChange = EFProveedorHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PROVEEDORES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFProveedorD: TLFEditFind2000
            Left = 91
            Top = 11
            Width = 64
            Height = 21
            TabOrder = 0
            OnChange = EFProveedorDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PROVEEDORES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEProveedorD: TLFDbedit
            Left = 156
            Top = 11
            Width = 356
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMLstMarcajes.DSxProveedorD
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEProveedorH: TLFDbedit
            Left = 156
            Top = 33
            Width = 356
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMLstMarcajes.DSxProveedorH
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object EFTareaProvD: TLFEditFind2000
            Left = 91
            Top = 133
            Width = 64
            Height = 21
            TabOrder = 10
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TAREA')
            Filtros = []
          end
          object EFOrdenProvD: TLFEditFind2000
            Left = 91
            Top = 89
            Width = 64
            Height = 21
            TabOrder = 6
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ID_ORDEN'
            CampoStr = 'COMPUESTO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_ORD'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ID_ORDEN')
            Filtros = []
          end
          object EFFaseProvD: TLFEditFind2000
            Left = 91
            Top = 111
            Width = 64
            Height = 21
            TabOrder = 8
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FASE')
            Filtros = []
          end
          object EFFaseProvH: TLFEditFind2000
            Left = 301
            Top = 111
            Width = 64
            Height = 21
            TabOrder = 9
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FASE')
            Filtros = []
          end
          object EFOrdenProvH: TLFEditFind2000
            Left = 301
            Top = 89
            Width = 64
            Height = 21
            TabOrder = 7
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ID_ORDEN'
            CampoStr = 'COMPUESTO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_ORD'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ID_ORDEN')
            Filtros = []
          end
          object EFTareaProvH: TLFEditFind2000
            Left = 301
            Top = 133
            Width = 64
            Height = 21
            TabOrder = 11
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TAREA')
            Filtros = []
          end
          object LFCompuestoProvD: TLFEditFind2000
            Left = 91
            Top = 67
            Width = 105
            Height = 21
            TabOrder = 4
            OnChange = LFCompuestoProvDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'COMPUESTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFCompuestoProvH: TLFEditFind2000
            Left = 301
            Top = 67
            Width = 105
            Height = 21
            TabOrder = 5
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'COMPUESTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TSVarios: TTabSheet
        Caption = 'Varios'
        ImageIndex = 3
        object Panel6: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 170
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LabelAgenteD: TLFLabel
            Left = 19
            Top = 15
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Agente'
          end
          object LabelAgenteH: TLFLabel
            Left = 22
            Top = 38
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Agente'
          end
          object Label18: TLFLabel
            Left = 24
            Top = 93
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Orden'
          end
          object Label19: TLFLabel
            Left = 237
            Top = 93
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Orden'
          end
          object Label20: TLFLabel
            Left = 243
            Top = 115
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fase'
          end
          object Label21: TLFLabel
            Left = 238
            Top = 136
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Tarea'
          end
          object Label22: TLFLabel
            Left = 25
            Top = 136
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Tarea'
          end
          object Label23: TLFLabel
            Left = 30
            Top = 115
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fase'
          end
          object Label28: TLFLabel
            Left = 0
            Top = 71
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Compuesto'
          end
          object Label29: TLFLabel
            Left = 213
            Top = 71
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Compuesto'
          end
          object DBEVariosD: TLFDbedit
            Left = 156
            Top = 11
            Width = 356
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMLstMarcajes.DSxRecursoD
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEVariosH: TLFDbedit
            Left = 156
            Top = 33
            Width = 356
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMLstMarcajes.DSxRecursoH
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object EFVariosD: TLFEditFind2000
            Left = 91
            Top = 11
            Width = 64
            Height = 21
            TabOrder = 0
            OnChange = EFVariosDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_RECURSOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'RECURSO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFVariosH: TLFEditFind2000
            Left = 91
            Top = 33
            Width = 64
            Height = 21
            TabOrder = 1
            OnChange = EFVariosHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_RECURSOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'RECURSO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFOrdenVarD: TLFEditFind2000
            Left = 91
            Top = 89
            Width = 64
            Height = 21
            TabOrder = 6
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ID_ORDEN'
            CampoStr = 'COMPUESTO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_ORD'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ID_ORDEN')
            Filtros = []
          end
          object EFOrdenVarH: TLFEditFind2000
            Left = 301
            Top = 89
            Width = 64
            Height = 21
            TabOrder = 7
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ID_ORDEN'
            CampoStr = 'COMPUESTO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_ORD'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ID_ORDEN')
            Filtros = []
          end
          object EFFaseVarH: TLFEditFind2000
            Left = 301
            Top = 111
            Width = 64
            Height = 21
            TabOrder = 9
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FASE')
            Filtros = []
          end
          object EFTareaVarH: TLFEditFind2000
            Left = 301
            Top = 133
            Width = 64
            Height = 21
            TabOrder = 11
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TAREA')
            Filtros = []
          end
          object EFTareaVarD: TLFEditFind2000
            Left = 91
            Top = 133
            Width = 64
            Height = 21
            TabOrder = 10
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TAREA')
            Filtros = []
          end
          object EFFaseVarD: TLFEditFind2000
            Left = 91
            Top = 111
            Width = 64
            Height = 21
            TabOrder = 8
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FASE')
            Filtros = []
          end
          object LFCompuestoVarD: TLFEditFind2000
            Left = 91
            Top = 67
            Width = 105
            Height = 21
            TabOrder = 4
            OnChange = LFCompuestoVarDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'COMPUESTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFCompuestoVarH: TLFEditFind2000
            Left = 301
            Top = 67
            Width = 105
            Height = 21
            TabOrder = 5
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'COMPUESTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
    end
    object PNLTop: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LabelFechaD: TLFLabel
        Left = 16
        Top = 12
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LabelFechaH: TLFLabel
        Left = 284
        Top = 13
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object DTFechaD: TLFDateEdit
        Left = 83
        Top = 8
        Width = 94
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTFEchaH: TLFDateEdit
        Left = 350
        Top = 9
        Width = 94
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 275
    inherited EComentario: TLFEdit
      TabOrder = 2
    end
    inherited CBOrden: TLFComboBox
      TabOrder = 0
      OnChange = CBOrdenChange
    end
    inherited TDPFechaListado: TLFDateEdit
      TabOrder = 1
    end
  end
  inherited ALMain: TLFActionList
    Left = 412
    Top = 14
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
