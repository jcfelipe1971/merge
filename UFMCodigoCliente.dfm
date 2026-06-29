inherited FMCodigoCliente: TFMCodigoCliente
  Left = 243
  Top = 272
  Caption = 'Codigos de Cliente'
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
        Width = 45
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 263
      end
      inherited TbuttComp: TToolButton
        Left = 271
      end
      object PNLFiltro: TLFPanel
        Left = 294
        Top = 0
        Width = 200
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LCodigoCliente: TLFLabel
          Left = 41
          Top = 4
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cod. Cliente'
        end
        object EFCodigoCliente: TLFEditFind2000
          Left = 102
          Top = 0
          Width = 97
          Height = 21
          TabOrder = 0
          OnChange = EFCodigoClienteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = False
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'CLIENTE')
          CampoNum = 'CODIGO_CLIENTE'
          CampoStr = 'TITULO_ART'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'ART_ARTICULOS_CODCLI'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CODIGO_CLIENTE')
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
          'CLIENTE'
          'CODIGO_CLIENTE'
          'NOMBRE_R_SOCIAL'
          'TITULO')
        CamposAOrdenarImgs = DMMain.ILOrdGrid
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_CLIENTE'
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
            FieldName = 'CLIENTE'
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
    Left = 616
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 652
    Top = 0
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
    Left = 680
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 720
    Top = 0
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 584
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 552
  end
  object xArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT APR.EMPRESA, APR.CODIGO_CLIENTE, APR.ARTICULO, ART.TITULO_LARGO AS TITULO' +
        ', APR.CLIENTE, TER.NOMBRE_R_SOCIAL'
      'FROM ART_ARTICULOS_CODCLI APR'
      'LEFT JOIN ART_ARTICULOS ART '
      
        'ON ((APR.EMPRESA = ART.EMPRESA) AND (APR.ARTICULO = ART.ARTICULO' +
        '))'
      'LEFT JOIN EMP_CLIENTES CLI '
      'ON ((APR.EMPRESA = CLI.EMPRESA) AND (APR.CLIENTE = CLI.CLIENTE))'
      'LEFT JOIN SYS_TERCEROS TER '
      'ON (CLI.TERCERO = TER.TERCERO)'
      'WHERE'
      'APR.EMPRESA = :EMPRESA AND'
      'APR.CODIGO_CLIENTE = :CODIGO_CLIENTE AND'
      'APR.ARTICULO = ?ARTICULO AND'
      'APR.CLIENTE = ?CLIENTE')
    SelectSQL.Strings = (
      
        'SELECT APR.EMPRESA, APR.CODIGO_CLIENTE, APR.ARTICULO, ART.TITULO_LARGO AS TITULO' +
        ', APR.CLIENTE, TER.NOMBRE_R_SOCIAL'
      'FROM ART_ARTICULOS_CODCLI APR'
      'LEFT JOIN ART_ARTICULOS ART '
      
        'ON ((APR.EMPRESA = ART.EMPRESA) AND (APR.ARTICULO = ART.ARTICULO' +
        '))'
      'LEFT JOIN EMP_CLIENTES CLI '
      'ON ((APR.EMPRESA = CLI.EMPRESA) AND (APR.CLIENTE = CLI.CLIENTE))'
      'LEFT JOIN SYS_TERCEROS TER '
      'ON (CLI.TERCERO = TER.TERCERO)'
      'WHERE'
      'APR.EMPRESA = :EMPRESA AND'
      'UPPER(APR.CODIGO_CLIENTE) LIKE UPPER(:CODIGO_CLIENTE)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    ClavesPrimarias.Strings = (
      'ARTICULO '
      'CLIENTE'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 520
    object xArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArticulosCODIGO_CLIENTE: TFIBStringField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'CODIGO_CLIENTE'
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
    object xArticulosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xArticulosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
end
