inherited FMRepartirLineaProyecto: TFMRepartirLineaProyecto
  Left = 516
  Top = 227
  Caption = 'Repartir Linea a Proyectos'
  ClientWidth = 801
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 801
    inherited TBMain: TLFToolBar
      Width = 797
      inherited NavMain: THYMNavigator
        DataSource = DSxProyecto
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 37
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 265
      end
      inherited TbuttComp: TToolButton
        Left = 273
      end
    end
    object DBGFProyectos: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 797
      Height = 302
      Align = alClient
      DataSource = DSxProyecto
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
        'PROYECTO')
      CamposAMostrar.Strings = (
        'PROYECTO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'AFEC_TOTAL')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      Numericos.Strings = (
        'PROYECTO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'EMP_PROYECTOS')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      Posicion = tpCentrado
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'PROYECTO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'PROYECTO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORC_AFECTACION'
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EJERCICIO'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNI_MAX'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IMPORTE'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TOTAL'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'AFEC_TOTAL'
          ReadOnly = True
          Width = 85
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 801
  end
  inherited CEMain: TControlEdit
    Left = 368
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 400
    Top = 0
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
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 464
    Top = 0
  end
  object xProyecto: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PROYECTOS_COMPRAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  PROYECTO=?old_PROYECTO AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PROYECTOS_COMPRAS'
      
        '  (EMPRESA,'#13#10'PROYECTO,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,UNIDA' +
        'DES,UNI_MAX,IMPORTE,'#13#10'AFEC_TOTAL,ID_DETALLES_E,ID_E,PORC_AFECTAC' +
        'ION)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?PROYECTO,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LIN' +
        'EA,?UNIDADES,?UNI_MAX,?IMPORTE,'#13#10'?AFEC_TOTAL,?ID_DETALLES_E,?ID_' +
        'E,?PORC_AFECTACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PROYECTOS_COMPRAS'
      'WHERE'
      '  ID_DETALLES_E = :ID_DETALLES_E AND'
      '  PROYECTO=?PROYECTO')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PROYECTOS_COMPRAS'
      'WHERE'
      'TIPO = :TIPO AND'
      'ID_DETALLES_E = :ID_DETALLES'
      'ORDER BY PROYECTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PROYECTOS_COMPRAS'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,UNI_MAX=?UNI_MAX '
      '  ,IMPORTE=?IMPORTE '
      '  ,AFEC_TOTAL=?AFEC_TOTAL '
      '  ,ID_DETALLES_E=?ID_DETALLES_E '
      '  ,ID_E=?ID_E '
      '  ,PORC_AFECTACION=?PORC_AFECTACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROYECTO=?PROYECTO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AfterDelete = xProyectoAfterDelete
    AfterPost = xProyectoAfterPost
    OnNewRecord = xProyectoNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'PROYECTO '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PROYECTOS_COMPRAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 496
    object xProyectoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProyectoPROYECTO: TIntegerField
      DisplayLabel = 'Propyecto'
      FieldName = 'PROYECTO'
    end
    object xProyectoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xProyectoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xProyectoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xProyectoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xProyectoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xProyectoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xProyectoUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xProyectoUNI_MAX: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNI_MAX'
    end
    object xProyectoIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xProyectoAFEC_TOTAL: TIntegerField
      DisplayLabel = 'Afectacion Total'
      FieldName = 'AFEC_TOTAL'
    end
    object xProyectoID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Detalle'
      FieldName = 'ID_DETALLES_E'
    end
    object xProyectoID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object xProyectoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xProyectoPORC_AFECTACION: TFloatField
      DisplayLabel = 'Porc. Afect.'
      FieldName = 'PORC_AFECTACION'
    end
  end
  object DSxProyecto: TDataSource
    DataSet = xProyecto
    Left = 528
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 560
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 592
  end
end
