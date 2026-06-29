object FMImportacionArticulosExcelArt: TFMImportacionArticulosExcelArt
  Left = 201
  Top = 173
  Width = 800
  Height = 500
  Caption = 'Importaci'#243'n de productos desde EXCEL'
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 22
    AutoSize = True
    ButtonWidth = 25
    EdgeBorders = [ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Separators = True
    object tbSeleccionarFichero: TToolButton
      Left = 0
      Top = 0
      Action = ASeleccionarFichero
    end
    object tbAbrirExcel: TToolButton
      Left = 25
      Top = 0
      Action = AAbrirExcel
    end
    object tbLeerSeleccion: TToolButton
      Left = 50
      Top = 0
      Action = ALeerSeleccion
    end
    object tbVerificarDatos: TToolButton
      Left = 75
      Top = 0
      Action = AVerificarDatos
    end
    object tbGuardarSeleccion: TToolButton
      Left = 100
      Top = 0
      Action = AGuardarSeleccion
    end
    object tbSeparador1: TToolButton
      Left = 125
      Top = 0
      Width = 8
      Enabled = False
      Style = tbsSeparator
    end
    object HYMEditPanel1: THYMEditPanel
      Left = 133
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
    end
    object ToolButton2: TToolButton
      Left = 156
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object tbColUdsPrecio: TToolButton
      Left = 164
      Top = 0
      Action = AColUdsPrecio
      Visible = False
    end
    object tbColdUdsEmbalaje: TToolButton
      Left = 189
      Top = 0
      Action = AColdUdsEmbalaje
      Visible = False
    end
    object CBImpSoloExist: TLFDBCheckBox
      Left = 214
      Top = 0
      Width = 143
      Height = 22
      Caption = 'Importar solo existentes'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 1
      TabStop = True
      Visible = False
      Alignment = taLeftJustify
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object ToolButton1: TToolButton
      Left = 357
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 365
      Top = 0
      DropdownMenu = PMConfiguracion
      ImageIndex = 2
      Style = tbsDropDown
    end
  end
  object sbEstado: TStatusBar
    Left = 0
    Top = 454
    Width = 792
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object PNLMain: TLFPanel
    Left = 0
    Top = 22
    Width = 792
    Height = 432
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PNLGrid: TLFPanel
      Left = 0
      Top = 0
      Width = 792
      Height = 432
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PNLGrid'
      TabOrder = 0
      object sgDatosImportados: TStringGrid
        Left = 0
        Top = 31
        Width = 792
        Height = 364
        Align = alClient
        Color = clInfoBk
        ColCount = 3
        DefaultDrawing = False
        FixedCols = 2
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 0
        OnDrawCell = sgDatosImportadosDrawCell
        OnMouseUp = sgDatosImportadosMouseUp
        OnSelectCell = sgDatosImportadosSelectCell
        ColWidths = (
          64
          64
          64)
        RowHeights = (
          24
          24)
      end
      object PUnidadesPrecio: TLFPanel
        Left = 0
        Top = 395
        Width = 792
        Height = 37
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object LTarifa: TLFLabel
          Left = 8
          Top = 11
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tarifa'
        end
        object LProveedor: TLFLabel
          Left = 357
          Top = 13
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor'
        end
        object EFTarifa: TEditFind2000
          Left = 39
          Top = 8
          Width = 49
          Height = 21
          TabOrder = 0
          OnChange = EFTarifaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TARIFA'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'activa=1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_TARIFAS_C'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TARIFA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EProveedor: TEditFind2000
          Left = 410
          Top = 9
          Width = 80
          Height = 21
          TabOrder = 1
          OnChange = EProveedorChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PROVEEDOR'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_PROVEEDORES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PROVEEDOR')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloProveedor: TLFEdit
          Left = 491
          Top = 9
          Width = 260
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 2
        end
        object ETituloTarifa: TLFEdit
          Left = 89
          Top = 8
          Width = 260
          Height = 21
          Color = clInfoBk
          TabOrder = 3
        end
      end
      object PNLFichero: TLFPanel
        Left = 0
        Top = 0
        Width = 792
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          792
          31)
        object lbFichero: TLFLabel
          Left = 11
          Top = 8
          Width = 101
          Height = 13
          Alignment = taRightJustify
          Caption = '&Fichero seleccionado'
          FocusControl = sgDatosImportados
          Layout = tlCenter
        end
        object ENombreFichero: TLFEdit
          Left = 115
          Top = 6
          Width = 646
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 0
        end
        object BSeleccionarFichero: TButton
          Left = 764
          Top = 4
          Width = 26
          Height = 24
          Action = ASeleccionarFichero
          Anchors = [akLeft, akTop, akRight]
          Caption = '...'
          TabOrder = 1
        end
      end
    end
  end
  object RightMenu: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 720
    Top = 12
    object EliminarColumna1: TMenuItem
      Action = AEliminaCol
    end
    object EliminaFila1: TMenuItem
      Action = AEliminaFila
    end
    object CrearColumna1: TMenuItem
      Action = ACreaCol
    end
    object CrearFila1: TMenuItem
      Action = ACreaFila
    end
    object DesasignarCampo1: TMenuItem
      Action = ADesasignarCampo
    end
    object N1: TMenuItem
      Caption = '-'
    end
  end
  object ALMain: TActionList
    Images = DMMain.ILMain_Ac
    Left = 612
    Top = 12
    object AEliminaCol: TAction
      Category = 'Grid'
      Caption = 'Eliminar Columna'
      Hint = 'Elimina la columna actual'
      OnExecute = AEliminaColExecute
    end
    object AEliminaFila: TAction
      Category = 'Grid'
      Caption = 'Elimina Fila'
      Hint = 'Elimina la fila actual'
      OnExecute = AEliminaFilaExecute
    end
    object AColUdsPrecio: TAction
      Category = 'Crear Columnas'
      Caption = 'Crear Col. Uds. Precio'
      Hint = 'Crear columna con las uds. precio.'
      ImageIndex = 8
    end
    object AColdUdsEmbalaje: TAction
      Category = 'Crear Columnas'
      Caption = 'Crear Col. Uds. Embalaje'
      Hint = 'Crear columna con las uds. embalaje.'
      ImageIndex = 146
    end
    object ACreaCol: TAction
      Category = 'Grid'
      Caption = 'Crear Columna'
      Hint = 'Crea una nueva columna'
      OnExecute = ACreaColExecute
    end
    object ACreaFila: TAction
      Category = 'Grid'
      Caption = 'Crear Fila'
      Hint = 'Crea una nueva fila'
      OnExecute = ACreaFilaExecute
    end
    object ASeleccionarFichero: TAction
      Category = 'Fichero'
      Caption = 'Seleccionar Fichero'
      Hint = 'Selecciona archivo Excel y lo abre'
      ImageIndex = 65
      OnExecute = ASeleccionarFicheroExecute
    end
    object AAbrirExcel: TAction
      Category = 'Fichero'
      Caption = 'Abrir Archivo Excel'
      Hint = 'Abre Excel con el fichero que se ha seleccionado'
      ImageIndex = 21
      OnExecute = AAbrirExcelExecute
    end
    object ALeerSeleccion: TAction
      Category = 'Fichero'
      Caption = 'Leer Seleccion'
      Hint = 'Lee los datos de EXCEL y lo cierra'
      ImageIndex = 42
      OnExecute = ALeerSeleccionExecute
    end
    object AVerificarDatos: TAction
      Category = 'Fichero'
      Caption = 'Verificar Datos'
      Hint = 'Verifica los datos'
      ImageIndex = 19
      OnExecute = AVerificarDatosExecute
    end
    object AGuardarSeleccion: TAction
      Category = 'Fichero'
      Caption = 'Guardar Seleccion'
      Hint = 'Guardar Seleccion'
      ImageIndex = 140
      OnExecute = AGuardarSeleccionExecute
    end
    object AGuardarConfiguracion: TAction
      Category = 'Configuracion'
      Caption = 'Guardar configuracion'
      ImageIndex = 41
      OnExecute = AGuardarConfiguracionExecute
    end
    object ADesasignarCampo: TAction
      Category = 'Grid'
      Caption = 'Desasignar Campo'
      Hint = 'Quita la asignacion de campo a esta columna'
      OnExecute = ADesasignarCampoExecute
    end
  end
  object FormPlacement1: TFormPlacement
    UseRegistry = False
    Left = 416
    Top = 8
  end
  object PMConfiguracion: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 720
    Top = 48
    object MIGuardarconfiguracion: TMenuItem
      Action = AGuardarConfiguracion
    end
  end
end
