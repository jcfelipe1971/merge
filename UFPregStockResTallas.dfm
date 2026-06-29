inherited FPregStockResTallas: TFPregStockResTallas
  Left = 351
  Top = 293
  Caption = ' Listado de Stock Resumido por Tallas'
  ClientHeight = 274
  ClientWidth = 479
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 479
    Height = 274
    inherited TBMain: TLFToolBar
      Width = 479
      object TBConRap: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
      object TButtMultiseleccion: TToolButton
        Left = 360
        Top = 0
        Action = AMultiseleccion
      end
    end
    inherited PBListado: TProgressBar
      Top = 258
      Width = 479
      TabOrder = 2
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 479
      Height = 222
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GBModelo: TGroupBox
        Left = 0
        Top = 80
        Width = 479
        Height = 82
        Align = alTop
        Caption = ' Referencia '
        TabOrder = 1
        object LDesdeReferencia: TLFLabel
          Left = 13
          Top = 24
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaReferencia: TLFLabel
          Left = 16
          Top = 46
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFModelo_D: TLFEditFind2000
          Left = 48
          Top = 21
          Width = 89
          Height = 21
          TabOrder = 0
          OnChange = EFModelo_DChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'REF_PROVEEDOR'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS_MODELOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'REF_PROVEEDOR')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFModelo_H: TLFEditFind2000
          Left = 48
          Top = 43
          Width = 89
          Height = 21
          TabOrder = 1
          OnChange = EFModelo_HChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'REF_PROVEEDOR'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS_MODELOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'REF_PROVEEDOR')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEModeloDesde: TLFDbedit
          Left = 138
          Top = 21
          Width = 327
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstStockResTallas.DSxMod_Desde
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
        object DBEModeloHasta: TLFDbedit
          Left = 138
          Top = 43
          Width = 327
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstStockResTallas.DSxMod_Hasta
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
      end
      object GBGrupos: TGroupBox
        Left = 0
        Top = 0
        Width = 479
        Height = 80
        Align = alTop
        Caption = ' Grupo de Tallas '
        TabOrder = 0
        object LDesdeGrupo: TLFLabel
          Left = 13
          Top = 24
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaGrupo: TLFLabel
          Left = 16
          Top = 46
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFGrupoDesde: TLFEditFind2000
          Left = 48
          Top = 21
          Width = 90
          Height = 21
          TabOrder = 0
          OnChange = EFGrupoDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'GRUPO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_GRUPOS_TALLAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'GRUPO')
          Filtros = []
        end
        object EFGrupoHasta: TLFEditFind2000
          Left = 48
          Top = 43
          Width = 90
          Height = 21
          TabOrder = 1
          OnChange = EFGrupoHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'GRUPO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_GRUPOS_TALLAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'GRUPO')
          Filtros = [obEmpresa]
        end
        object DBEGrupoDesde: TLFDbedit
          Left = 139
          Top = 21
          Width = 325
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstStockResTallas.DSxGrupo_Desde
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
        object DBEGrupoHasta: TLFDbedit
          Left = 139
          Top = 43
          Width = 325
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMLstStockResTallas.DSxGrupo_Hasta
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
      end
      object GBAlmacen: TGroupBox
        Left = 0
        Top = 152
        Width = 479
        Height = 70
        Align = alBottom
        TabOrder = 2
        object LAlmacen: TLFLabel
          Left = 20
          Top = 38
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almac'#233'n'
        end
        object LTipo: TLFLabel
          Left = 40
          Top = 17
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo'
        end
        object LFechaCalculo: TLFLabel
          Left = 192
          Top = 16
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Calculo'
        end
        object CBStock: TLFComboBox
          Left = 65
          Top = 13
          Width = 89
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Stock Real'
          Items.Strings = (
            'Stock Real'
            'Stock Virtual')
        end
        object EFSelAlmacen: TLFEditFind2000
          Left = 65
          Top = 35
          Width = 45
          Height = 21
          TabOrder = 1
          OnChange = EFSelAlmacenChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EAlmacenDesc: TLFEdit
          Left = 111
          Top = 35
          Width = 354
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object DEFechaCalculo: TLFDateEdit
          Left = 264
          Top = 13
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 3
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 356
    Top = 62
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AMultiseleccion: TAction
      Caption = '&Multi -Sel.'
      Hint = 'Multi-seleccion'
      ImageIndex = 132
      OnExecute = AMultiseleccionExecute
    end
  end
end
