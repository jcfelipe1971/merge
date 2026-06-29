object FMInformacionComercial: TFMInformacionComercial
  Left = 305
  Top = 103
  Width = 563
  Height = 503
  Caption = 'Informaci'#243'n Comercial'
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 555
    Height = 178
    Align = alTop
    Caption = 'Cliente'
    TabOrder = 0
    object Label1: TLFLabel
      Left = 32
      Top = 43
      Width = 34
      Height = 13
      Caption = 'Agente'
    end
    object Label2: TLFLabel
      Left = 386
      Top = 42
      Width = 23
      Height = 13
      Caption = 'Ruta'
    end
    object Label24: TLFLabel
      Left = 34
      Top = 23
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label11: TLFLabel
      Left = 38
      Top = 86
      Width = 28
      Height = 13
      Caption = 'Notas'
    end
    object Label12: TLFLabel
      Left = 40
      Top = 63
      Width = 26
      Height = 13
      Caption = 'N.I.F.'
    end
    object Label13: TLFLabel
      Left = 356
      Top = 65
      Width = 72
      Height = 13
      Caption = 'Forma de Pago'
    end
    object Label14: TLFLabel
      Left = 206
      Top = 65
      Width = 63
      Height = 13
      Caption = 'Dias de pago'
    end
    object Label3: TLFLabel
      Left = 12
      Top = 112
      Width = 54
      Height = 13
      Caption = 'Agrupaci'#243'n'
    end
    object DBEdit1: TLFDbedit
      Left = 74
      Top = 38
      Width = 57
      Height = 21
      Color = clInfoBk
      DataField = 'AGENTE'
      DataSource = DMInformacionComercial.DSxEmpClientes
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TLFDbedit
      Left = 418
      Top = 38
      Width = 121
      Height = 21
      BevelOuter = bvNone
      Color = clInfoBk
      DataField = 'RUTA'
      DataSource = DMInformacionComercial.DSxEmpClientes
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TLFDbedit
      Left = 74
      Top = 16
      Width = 57
      Height = 21
      Color = clInfoBk
      DataField = 'CLIENTE'
      DataSource = DMInformacionComercial.DSxConCuentasGesCli
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TLFDbedit
      Left = 130
      Top = 16
      Width = 321
      Height = 21
      Color = clInfoBk
      DataField = 'NOMBRE_R_SOCIAL'
      DataSource = DMInformacionComercial.DSxSysTerceros
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit5: TLFDbedit
      Left = 130
      Top = 38
      Width = 249
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMInformacionComercial.DSxVerAgente
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit15: TLFDbedit
      Left = 458
      Top = 16
      Width = 81
      Height = 21
      Color = clInfoBk
      DataField = 'TIPO_RAZON'
      DataSource = DMInformacionComercial.DSxSysTerceros
      ReadOnly = True
      TabOrder = 5
    end
    object DBMemo2: TLFDBMemo
      Left = 74
      Top = 82
      Width = 465
      Height = 39
      Color = clInfoBk
      DataField = 'NOTAS'
      DataSource = DMInformacionComercial.DSxEmpClientes
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit19: TLFDbedit
      Left = 74
      Top = 60
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'NIF'
      DataSource = DMInformacionComercial.DSxSysTerceros
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit20: TLFDbedit
      Left = 274
      Top = 61
      Width = 33
      Height = 21
      Color = clInfoBk
      DataField = 'DIA_PAGO_1'
      DataSource = DMInformacionComercial.DSxEmpClientes
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit21: TLFDbedit
      Left = 314
      Top = 61
      Width = 33
      Height = 21
      Color = clInfoBk
      DataField = 'DIA_PAGO_2'
      DataSource = DMInformacionComercial.DSxEmpClientes
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit22: TLFDbedit
      Left = 434
      Top = 60
      Width = 41
      Height = 21
      BevelInner = bvNone
      Color = clInfoBk
      DataField = 'FORMA_PAGO'
      DataSource = DMInformacionComercial.DSxConCuentasGesCli
      ReadOnly = True
      TabOrder = 10
    end
    object DBGrid1: TDBGrid
      Left = 74
      Top = 120
      Width = 465
      Height = 53
      Color = clInfoBk
      DataSource = DMInformacionComercial.DSxEmpAgrupacionesCli
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 11
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'AGRUPACION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 64
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 178
    Width = 555
    Height = 94
    Align = alTop
    Caption = 'Personas de contacto'
    TabOrder = 1
    object Label5: TLFLabel
      Left = 34
      Top = 40
      Width = 18
      Height = 13
      Caption = 'Tel.'
    end
    object Label6: TLFLabel
      Left = 210
      Top = 40
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object Label9: TLFLabel
      Left = 378
      Top = 40
      Width = 25
      Height = 13
      Caption = 'Movil'
    end
    object Label4: TLFLabel
      Left = 24
      Top = 66
      Width = 28
      Height = 13
      Caption = 'Notas'
    end
    object DBEdit6: TLFDbedit
      Left = 66
      Top = 19
      Width = 185
      Height = 21
      Color = clInfoBk
      DataField = 'APELLIDOS'
      DataSource = DMInformacionComercial.DSxSysTercerosContacto
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit7: TLFDbedit
      Left = 250
      Top = 19
      Width = 177
      Height = 21
      Color = clInfoBk
      DataField = 'NOMBRE'
      DataSource = DMInformacionComercial.DSxSysTercerosContacto
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit8: TLFDbedit
      Left = 66
      Top = 40
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'TELEFONO'
      DataSource = DMInformacionComercial.DSxSysTercerosContacto
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit36: TLFDbedit
      Left = 242
      Top = 40
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'FAX'
      DataSource = DMInformacionComercial.DSxSysTercerosContacto
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit37: TLFDbedit
      Left = 418
      Top = 40
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'MOVIL'
      DataSource = DMInformacionComercial.DSxSysTercerosContacto
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit38: TLFDbedit
      Left = 27
      Top = 19
      Width = 38
      Height = 21
      Color = clInfoBk
      DataField = 'CONTACTO'
      DataSource = DMInformacionComercial.DSxSysTercerosContacto
      ReadOnly = True
      TabOrder = 5
    end
    object DBMemo1: TLFDBMemo
      Left = 66
      Top = 62
      Width = 473
      Height = 25
      Color = clInfoBk
      DataSource = DMInformacionComercial.DSxSysTercerosContacto
      ReadOnly = True
      TabOrder = 6
    end
    object DBNavigator1: TDBNavigator
      Left = 434
      Top = 10
      Width = 112
      Height = 25
      DataSource = DMInformacionComercial.DSxSysTercerosContacto
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 7
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 272
    Width = 555
    Height = 112
    Align = alTop
    Caption = 'Direcciones'
    TabOrder = 2
    object Label23: TLFLabel
      Left = 12
      Top = 65
      Width = 46
      Height = 13
      Caption = 'Localidad'
    end
    object Label25: TLFLabel
      Left = 38
      Top = 42
      Width = 20
      Height = 13
      Caption = 'C.P.'
    end
    object Label26: TLFLabel
      Left = 38
      Top = 86
      Width = 20
      Height = 13
      Caption = 'Pais'
    end
    object Label27: TLFLabel
      Left = 188
      Top = 43
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object Label28: TLFLabel
      Left = 395
      Top = 43
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object Label29: TLFLabel
      Left = 202
      Top = 64
      Width = 27
      Height = 13
      Caption = 'e-mail'
    end
    object Label30: TLFLabel
      Left = 202
      Top = 86
      Width = 23
      Height = 13
      Caption = 'Web'
    end
    object DBEdit9: TLFDbedit
      Left = 66
      Top = 17
      Width = 324
      Height = 21
      Color = clInfoBk
      DataField = 'DIR_COMPLETA_N'
      DataSource = DMInformacionComercial.DSxSysTercerosDireccion
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit10: TLFDbedit
      Left = 26
      Top = 17
      Width = 40
      Height = 21
      Color = clInfoBk
      DataField = 'DIRECCION'
      DataSource = DMInformacionComercial.DSxSysTercerosDireccion
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit11: TLFDbedit
      Left = 66
      Top = 39
      Width = 121
      Height = 21
      BevelEdges = []
      Color = clInfoBk
      DataField = 'CODIGO_POSTAL'
      DataSource = DMInformacionComercial.DSxSysLocalidades
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit12: TLFDbedit
      Left = 66
      Top = 61
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMInformacionComercial.DSxSysLocalidades
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit13: TLFDbedit
      Left = 66
      Top = 83
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'PAIS'
      DataSource = DMInformacionComercial.DSxSysLocalidades
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit14: TLFDbedit
      Left = 234
      Top = 39
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'TELEFONO01'
      DataSource = DMInformacionComercial.DSxSysTerceros
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit39: TLFDbedit
      Left = 418
      Top = 39
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'TELEFAX'
      DataSource = DMInformacionComercial.DSxSysTerceros
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit40: TLFDbedit
      Left = 234
      Top = 61
      Width = 305
      Height = 21
      Color = clInfoBk
      DataField = 'EMAIL'
      DataSource = DMInformacionComercial.DSxSysTerceros
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit41: TLFDbedit
      Left = 234
      Top = 83
      Width = 305
      Height = 21
      Color = clInfoBk
      DataField = 'WEB'
      DataSource = DMInformacionComercial.DSxSysTerceros
      ReadOnly = True
      TabOrder = 8
    end
    object DBNavigator2: TDBNavigator
      Left = 434
      Top = 10
      Width = 112
      Height = 25
      DataSource = DMInformacionComercial.DSxSysTercerosDireccion
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 9
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 384
    Width = 555
    Height = 92
    Align = alClient
    Caption = 'Domiciliaci'#243'n Bancaria'
    TabOrder = 3
    object Label10: TLFLabel
      Left = 26
      Top = 19
      Width = 31
      Height = 13
      Caption = 'Banco'
    end
    object DBEdit16: TLFDbedit
      Left = 106
      Top = 38
      Width = 49
      Height = 21
      Color = clInfoBk
      DataField = 'ENTIDAD'
      DataSource = DMInformacionComercial.DSxSysTerceronsBancos
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit17: TLFDbedit
      Left = 356
      Top = 38
      Width = 184
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMInformacionComercial.DSxSysBancos
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit18: TLFDbedit
      Left = 154
      Top = 38
      Width = 57
      Height = 21
      Color = clInfoBk
      DataField = 'SUCURSAL'
      DataSource = DMInformacionComercial.DSxSysTerceronsBancos
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit23: TLFDbedit
      Left = 210
      Top = 38
      Width = 65
      Height = 21
      Color = clInfoBk
      DataField = 'CONTROL'
      DataSource = DMInformacionComercial.DSxSysTerceronsBancos
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit24: TLFDbedit
      Left = 274
      Top = 38
      Width = 81
      Height = 21
      Color = clInfoBk
      DataField = 'CUENTA'
      DataSource = DMInformacionComercial.DSxSysTerceronsBancos
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit25: TLFDbedit
      Left = 66
      Top = 38
      Width = 39
      Height = 21
      Color = clInfoBk
      DataField = 'BANCO'
      DataSource = DMInformacionComercial.DSxSysTerceronsBancos
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit26: TLFDbedit
      Left = 66
      Top = 16
      Width = 329
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMInformacionComercial.DSxSysTerceronsBancos
      ReadOnly = True
      TabOrder = 6
    end
    object DBNavigator3: TDBNavigator
      Left = 434
      Top = 10
      Width = 112
      Height = 25
      DataSource = DMInformacionComercial.DSxSysTerceronsBancos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 7
    end
    object LFDbedit1: TLFDbedit
      Left = 66
      Top = 60
      Width = 289
      Height = 21
      Color = clInfoBk
      DataField = 'IBAN'
      DataSource = DMInformacionComercial.DSxSysTerceronsBancos
      ReadOnly = True
      TabOrder = 8
    end
  end
end
