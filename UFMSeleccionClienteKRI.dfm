object FMSeleccionClienteKRI: TFMSeleccionClienteKRI
  Left = 272
  Top = 289
  Width = 554
  Height = 369
  ActiveControl = ECliente
  Caption = 'Seleccione Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLCliente: TLFPanel
    Left = 0
    Top = 0
    Width = 546
    Height = 169
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object PNLDetCliente: TLFPanel
      Left = 0
      Top = 25
      Width = 546
      Height = 144
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGCliente: TNsDBGrid
        Left = 0
        Top = 0
        Width = 546
        Height = 144
        Align = alClient
        DataSource = DSCliente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGClienteDblClick
        OnKeyUp = DBGClienteKeyUp
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CLIENTE'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            Width = 440
            Visible = True
          end>
      end
    end
    object PNLCabCliente: TLFPanel
      Left = 0
      Top = 0
      Width = 546
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LCliente: TLFLabel
        Left = 20
        Top = 5
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente'
      end
      object ECliente: TLFEdit
        Left = 56
        Top = 2
        Width = 121
        Height = 21
        AutoSelect = False
        TabOrder = 0
        OnChange = EClienteChange
        OnKeyUp = EClienteKeyUp
      end
    end
  end
  object PNLContacto: TLFPanel
    Left = 0
    Top = 169
    Width = 546
    Height = 143
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object PNLDetContacto: TLFPanel
      Left = 0
      Top = 25
      Width = 546
      Height = 118
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGContacto: TNsDBGrid
        Left = 0
        Top = 0
        Width = 546
        Height = 118
        Align = alClient
        DataSource = DSContacto
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGContactoDblClick
        OnKeyUp = DBGContactoKeyUp
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CONTACTO'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CONCATENATION'
            Width = 440
            Visible = True
          end>
      end
    end
    object PNLCabContacto: TLFPanel
      Left = 0
      Top = 0
      Width = 546
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      Visible = False
      object LContacto: TLFLabel
        Left = 9
        Top = 5
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Contacto'
      end
      object EContacto: TLFEdit
        Left = 56
        Top = 2
        Width = 121
        Height = 21
        TabOrder = 0
        OnKeyUp = EContactoKeyUp
      end
    end
  end
  object PNLPie: TLFPanel
    Left = 0
    Top = 312
    Width = 546
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BOk: TButton
      Left = 195
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 0
      OnClick = BOkClick
    end
    object BCancel: TButton
      Left = 275
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = BCancelClick
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 504
    Top = 8
  end
  object xContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CONTACTO, TRIM(APELLIDOS)||'#39' '#39'||NOMBRE FROM SYS_TERCEROS' +
        '_CONTACTOS'
      'WHERE'
      'TERCERO=?TERCERO'
      'ORDER BY CONTACTO')
    UniDirectional = False
    DataSource = DSCliente
    Left = 464
    Top = 8
    object xContactoCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xContactoCONCATENATION: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'CONCATENATION'
      Size = 121
    end
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT E.CLIENTE, T.NOMBRE_R_SOCIAL, E.TERCERO, E.AGENTE'
      'FROM EMP_CLIENTES E'
      'JOIN CON_CUENTAS_GES_CLI C'
      'ON C.EMPRESA = E.EMPRESA AND C.CLIENTE = E.CLIENTE'
      'JOIN SYS_TERCEROS T'
      'ON E.TERCERO = T.TERCERO'
      'WHERE'
      'E.EMPRESA = ?EMPRESA AND'
      'C.EJERCICIO = ?EJERCICIO AND'
      'C.CANAL = ?CANAL AND'
      'E.BAJA = 0'
      'AND'
      '((UPPER(cast(E.CLIENTE as varchar(60))) LIKE ?CLIENTE) OR'
      ' (UPPER(T.NOMBRE_R_SOCIAL) LIKE ?CLIENTE))'
      'ORDER BY E.CLIENTE')
    UniDirectional = False
    AfterClose = xClienteAfterClose
    AfterOpen = xClienteAfterOpen
    Left = 432
    Top = 8
    object xClienteCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xClienteNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xClienteTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSCliente: TDataSource
    DataSet = xCliente
    Left = 432
    Top = 40
  end
  object DSContacto: TDataSource
    DataSet = xContacto
    Left = 464
    Top = 40
  end
end
