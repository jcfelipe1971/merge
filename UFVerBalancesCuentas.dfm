inherited FVerBalancesCuentas: TFVerBalancesCuentas
  Left = 610
  Top = 245
  HelpContext = 1810
  BorderIcons = [biSystemMenu]
  Caption = 'Ver detalle de Cuentas de grupos de Balances'
  ClientHeight = 447
  ClientWidth = 760
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 760
    Height = 423
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 756
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object DBGMain: THYTDBGrid
      Left = 2
      Top = 28
      Width = 756
      Height = 393
      Align = alClient
      Color = clInfoBk
      DataSource = DSxVerBalancesCuentas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DBGMainKeyPress
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'ACTUAL'
        'ANTERIOR'
        'CUENTA'
        'TITULO')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'CUENTA'
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 378
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ANTERIOR'
          Title.Alignment = taRightJustify
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACTUAL'
          Title.Alignment = taRightJustify
          Width = 110
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 423
    Width = 760
    TabOrder = 0
  end
  object xVerBalancesCuentas: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT cuenta,titulo,anterior,actual FROM '
      'VER_BALANCES_CONTENIDO_CUENTAS'
      
        'where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?cana' +
        'l)and'
      '(periodo=?periodo)and(balance=?balance)and(clave=?clave))')
    SelectSQL.Strings = (
      
        'SELECT CUENTA, TITULO, ANTERIOR, ACTUAL FROM VER_BALANCES_CONTEN' +
        'IDO_CUENTAS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'PERIODO = ?PERIODO AND'
      'BALANCE = ?BALANCE AND'
      'CLAVE = ?CLAVE'
      'ORDER BY CUENTA')
    UniDirectional = False
    DataSource = FVerBalances.DSxVerBalance
    ClavesPrimarias.Strings = (
      'empresa)and(ejercicio=?ejercicio)and(canal=?canal)and'#13
      'ejercicio)and(canal=?canal)and'#13
      'canal)and'#13
      'periodo)and(balance=?balance)and(clave=?clave))'#13
      'balance)and(clave=?clave))'#13
      'clave))'#13)
    Opciones = []
    AutoSQLdeVistas = False
    Left = 42
    Top = 52
    object xVerBalancesCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xVerBalancesCuentasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      DisplayWidth = 150
      FieldName = 'TITULO'
      Size = 150
    end
    object xVerBalancesCuentasANTERIOR: TFloatField
      DisplayLabel = 'Anterior'
      FieldName = 'ANTERIOR'
    end
    object xVerBalancesCuentasACTUAL: TFloatField
      DisplayLabel = 'Actual'
      FieldName = 'ACTUAL'
    end
  end
  object DSxVerBalancesCuentas: TDataSource
    DataSet = xVerBalancesCuentas
    Left = 94
    Top = 54
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 140
    Top = 52
  end
end
