inherited FBuscaConfiguracion: TFBuscaConfiguracion
  Width = 530
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Configuracion Filtro'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 520
    inherited TBMain: TLFToolBar
      Width = 516
      inherited NavMain: THYMNavigator
        Width = 216
        DataSource = DSxDiccionaro
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 216
      end
      inherited EPMain: THYMEditPanel
        Left = 224
        Width = 29
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 253
      end
      inherited TbuttComp: TToolButton
        Left = 261
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 516
      Height = 302
      Align = alClient
      DataSource = DSxDiccionaro
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 1
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
      Transaction = TLocal
      BuscarNums = False
      BuscarChars = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'VISIBLE')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
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
          Color = clInfoBk
          Expanded = False
          FieldName = 'CAMPO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VISIBLE'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN_BUSCADOR'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 520
  end
  inherited CEMain: TControlEdit
    Left = 360
    Top = 80
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 392
    Top = 80
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
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
    Left = 432
    Top = 80
  end
  inherited FSMain: TLFFibFormStorage
    Left = 464
    Top = 80
  end
  object xDiccionaro: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DIC_CAMPOS_TEXTOS'
      'WHERE'
      '  RELACION=?RELACION AND '
      '  CAMPO=?CAMPO AND '
      '  IDIOMA=?IDIOMA ')
    InsertSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DIC_CAMPOS_TEXTOS'
      'WHERE'
      '  RELACION=?RELACION AND '
      '  CAMPO=?CAMPO AND '
      '  IDIOMA=?IDIOMA ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DIC_CAMPOS_TEXTOS'
      'WHERE'
      '  RELACION=?RELACION AND '
      '  CAMPO=?CAMPO AND '
      '  IDIOMA=?IDIOMA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DIC_CAMPOS_TEXTOS'
      'WHERE'
      '  RELACION = :RELACION AND'
      '  IDIOMA = :IDIOMA'
      'ORDER BY ORDEN_BUSCADOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DIC_CAMPOS_TEXTOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,VISIBLE=?VISIBLE '
      '  ,ORDEN_BUSCADOR=?ORDEN_BUSCADOR '
      'WHERE'
      '  RELACION=?RELACION AND '
      '  CAMPO=?CAMPO AND '
      '  IDIOMA=?IDIOMA ')
    AfterPost = xDiccionaroAfterPost
    BeforeEdit = xDiccionaroBeforeEdit
    ClavesPrimarias.Strings = (
      'RELACION '
      'CAMPO '
      'IDIOMA ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DIC_CAMPOS_TEXTOS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'CON_CUENTAS_GES_AGE'
      'EMP_AGENTES')
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CUENTA'
      'EMPRESA,AGENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 360
    Top = 112
    object xDiccionaroRELACION: TFIBStringField
      DisplayLabel = 'Relacion'
      FieldName = 'RELACION'
      ReadOnly = True
      Size = 31
    end
    object xDiccionaroCAMPO: TFIBStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      ReadOnly = True
      Size = 31
    end
    object xDiccionaroORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
      ReadOnly = True
    end
    object xDiccionaroORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      ReadOnly = True
      Size = 31
    end
    object xDiccionaroIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      ReadOnly = True
      Size = 3
    end
    object xDiccionaroTEXTO: TIntegerField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      ReadOnly = True
    end
    object xDiccionaroTIPO: TIntegerField
      DisplayLabel = 'tipo'
      FieldName = 'TIPO'
      ReadOnly = True
    end
    object xDiccionaroDEFECTO: TMemoField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
      ReadOnly = True
      BlobType = ftMemo
      Size = 8
    end
    object xDiccionaroTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object xDiccionaroNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      ReadOnly = True
      BlobType = ftMemo
      Size = 8
    end
    object xDiccionaroVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object xDiccionaroORDEN_BUSCADOR: TIntegerField
      DisplayLabel = 'Orden Buscador'
      FieldName = 'ORDEN_BUSCADOR'
    end
  end
  object DSxDiccionaro: TDataSource
    DataSet = xDiccionaro
    Left = 392
    Top = 112
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 432
    Top = 112
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 464
    Top = 112
  end
end
