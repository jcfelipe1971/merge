inherited FMCodigoProveedor: TFMCodigoProveedor
  Left = 243
  Top = 272
  Caption = 'Codigos de Proveedor'
  ClientHeight = 371
  ClientWidth = 790
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 347
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        Width = 210
        DataSource = DSxArticulos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 210
      end
      inherited EPMain: THYMEditPanel
        Left = 218
        Width = 37
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 255
      end
      inherited TbuttComp: TToolButton
        Left = 263
      end
      object PNLFiltro: TLFPanel
        Left = 286
        Top = 0
        Width = 200
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object LCodigoProveedor: TLFLabel
          Left = 15
          Top = 4
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cod. Proveedor'
        end
        object EFCodigoProveedor: TLFEditFind2000
          Left = 93
          Top = 0
          Width = 105
          Height = 21
          TabOrder = 0
          OnChange = EFCodigoProveedorChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'PROVEEDOR')
          CampoNum = 'CODIGO_PROVEEDOR'
          CampoStr = 'TITULO_ART'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'ART_ARTICULOS_CODPROV'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CODIGO_PROVEEDOR')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
      end
    end
    object PNLDetalle: TLFPanel
      Left = 2
      Top = 28
      Width = 786
      Height = 317
      Align = alClient
      TabOrder = 1
      object DBGArticulos: THYTDBGrid
        Left = 1
        Top = 1
        Width = 784
        Height = 315
        Align = alClient
        Color = clInfoBk
        DataSource = DSxArticulos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGArticulosDblClick
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        PermutaPaneles = False
        CamposAOrdenar.Strings = (
          'ARTICULO'
          'CODIGO_PROVEEDOR'
          'NOMBRE_R_SOCIAL'
          'PROVEEDOR'
          'TITULO')
        CamposAOrdenarImgs = DMMain.ILOrdGrid
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_PROVEEDOR'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO'
            Width = 240
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROVEEDOR'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            Width = 240
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 347
    Width = 790
  end
  inherited CEMain: TControlEdit
    Left = 632
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 668
    Top = 4
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
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 704
    Top = 4
  end
  inherited FSMain: TLFFibFormStorage
    Left = 744
    Top = 4
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 600
    Top = 4
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 560
    Top = 4
  end
  object xArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'select apr.empresa,apr.codigo_proveedor,apr.articulo,art.titulo_largo as titulo,' +
        'apr.proveedor,ter.nombre_r_social'
      'from art_articulos_codprov apr '
      'left join art_articulos art '
      'on((apr.empresa=art.empresa)and(apr.articulo=art.articulo))'
      'left join emp_proveedores pro '
      'on((apr.empresa=pro.empresa)and(apr.proveedor=pro.proveedor))'
      'left join sys_terceros ter'
      'on(pro.tercero=ter.tercero)'
      'where'
      'apr.EMPRESA = ?EMPRESA AND'
      'apr.CODIGO_PROVEEDOR = ?CODIGO_PROVEEDOR AND'
      'apr.proveedor = ?PROVEEDOR AND'
      'apr.articulo = ?ARTICULO')
    SelectSQL.Strings = (
      
        'select apr.empresa,apr.codigo_proveedor,apr.articulo,art.titulo_largo as titulo,' +
        'apr.proveedor,ter.nombre_r_social'
      'from art_articulos_codprov apr '
      'left join art_articulos art '
      'on((apr.empresa=art.empresa)and(apr.articulo=art.articulo))'
      'left join emp_proveedores pro '
      'on((apr.empresa=pro.empresa)and(apr.proveedor=pro.proveedor))'
      'left join sys_terceros ter'
      'on(pro.tercero=ter.tercero)'
      'where'
      'apr.EMPRESA = ?EMPRESA AND'
      'UPPER(apr.CODIGO_PROVEEDOR) LIKE UPPER(?CODIGO_PROVEEDOR)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CODIGO_PROVEEDOR '
      'PROVEEDOR '
      'ARTICULO'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 528
    Top = 4
    object xArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArticulosCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Cod. Proveedor'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
    object xArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xArticulosPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xArticulosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
end
