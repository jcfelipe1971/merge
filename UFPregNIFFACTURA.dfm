inherited FPregNIFFactura: TFPregNIFFactura
  Left = 755
  Top = 190
  Caption = 'Datos del Cliente'
  ClientHeight = 412
  ClientWidth = 504
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 388
    object LBLNif: TLFLabel [0]
      Left = 38
      Top = 55
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = 'NIF'
    end
    object LDireccion: TLFLabel [1]
      Left = 11
      Top = 149
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Direcci'#243'n'
    end
    object LCodPostal: TLFLabel [2]
      Left = 1
      Top = 171
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'd. Postal'
    end
    object LProvincia: TLFLabel [3]
      Left = 11
      Top = 193
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Provincia'
    end
    object LBLNombre: TLFLabel [4]
      Left = 18
      Top = 34
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object LBLPais: TLFLabel [5]
      Left = 35
      Top = 236
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pais'
    end
    object LLocalidad: TLFLabel [6]
      Left = 162
      Top = 147
      Width = 46
      Height = 13
      Caption = 'Localidad'
    end
    object LTelefono01: TLFLabel [7]
      Left = 13
      Top = 259
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tel'#233'fono'
    end
    object LTelefono02: TLFLabel [8]
      Left = 166
      Top = 259
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tel'#233'fono 2'
    end
    object LTelefax: TLFLabel [9]
      Left = 344
      Top = 259
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefax'
    end
    object LEmail: TLFLabel [10]
      Left = 28
      Top = 281
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'e-mail'
    end
    object LNotas: TLFLabel [11]
      Left = 27
      Top = 303
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Notas'
    end
    object LColonia: TLFLabel [12]
      Left = 20
      Top = 215
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Colonia'
    end
    object LFirma: TLFLabel [13]
      Left = 276
      Top = 303
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Firma'
    end
    object LBLNombreContacto: TLFLabel [14]
      Left = 12
      Top = 127
      Width = 43
      Height = 13
      Caption = 'Contacto'
    end
    object LDBLCComoNosConocieron: TLFLabel [15]
      Left = 8
      Top = 362
      Width = 86
      Height = 13
      Hint = 'Como Nos Conocieron'
      Alignment = taRightJustify
      Caption = 'Como Nos Conoc.'
    end
    object LPaisDocumento: TLFLabel [16]
      Left = 9
      Top = 77
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pais Doc.'
    end
    object LTipoDocumento: TLFLabel [17]
      Left = 132
      Top = 78
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Doc.'
    end
    object LValidacionDocumento: TLFLabel [18]
      Left = 6
      Top = 94
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Validacion'
    end
    object DBTValidacionResultado: TDBText [19]
      Left = 60
      Top = 95
      Width = 359
      Height = 12
      Color = clBtnFace
      DataField = 'RESULTADO'
      DataSource = DSxValidacionDoc
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object DBTValidacionNombre: TDBText [20]
      Left = 60
      Top = 107
      Width = 430
      Height = 12
      Color = clBtnFace
      DataField = 'RESULTADO_NOMBRE'
      DataSource = DSxValidacionDoc
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object DBTValidacionFechaCombrobacion: TDBText [21]
      Left = 419
      Top = 95
      Width = 71
      Height = 12
      Color = clBtnFace
      DataField = 'FECHA_COMPROBACION'
      DataSource = DSxValidacionDoc
      ParentColor = False
    end
    inherited TBMain: TLFToolBar
      Width = 500
      TabOrder = 21
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TButtConfirmar: TToolButton
        Left = 33
        Top = 0
        Hint = 'Confirmar Datos del Cliente'
        Caption = 'Confirmar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtConfirmarClick
      end
      object TButtBorrar: TToolButton
        Left = 56
        Top = 0
        Hint = 'Borrar Registro de Datos'
        Caption = 'Borrar'
        ImageIndex = 27
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtBorrarClick
      end
      object Sep1: TToolButton
        Left = 79
        Top = 0
        Width = 8
        ImageIndex = 28
        Style = tbsSeparator
      end
      object BActualizarTercero: TToolButton
        Left = 87
        Top = 0
        Action = ACrearTercero
        ParentShowHint = False
        ShowHint = True
      end
      object PNLTercero: TLFPanel
        Left = 110
        Top = 0
        Width = 139
        Height = 22
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        object LTercero: TLFLabel
          Left = 16
          Top = 4
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tercero'
        end
        object DBETercero: TLFDbedit
          Left = 56
          Top = 0
          Width = 81
          Height = 21
          Color = clInfoBk
          DataField = 'TERCERO'
          DataSource = DMFacturas.DSQMNIF
          TabOrder = 0
          OnChange = DBETerceroChange
        end
      end
    end
    object DBENif: TLFDbedit
      Left = 60
      Top = 52
      Width = 135
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NIF'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 1
      OnChange = DBENifChange
      OnExit = DBEFPaisDocIdentExit
    end
    object DBEDireccion: TLFDbedit
      Left = 60
      Top = 145
      Width = 430
      Height = 21
      DataField = 'DIRECCION'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 7
    end
    object DBECodPostal: TLFDbedit
      Left = 60
      Top = 167
      Width = 63
      Height = 21
      DataField = 'C_POSTAL'
      DataSource = DMFacturas.DSQMNIF
      MaxLength = 5
      TabOrder = 8
    end
    object DBEProvincia: TLFDbedit
      Left = 60
      Top = 189
      Width = 282
      Height = 21
      DataField = 'PROVINCIA'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 10
    end
    object DBENombre: TLFDbedit
      Left = 60
      Top = 30
      Width = 430
      Height = 21
      DataField = 'NOMBRE'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 0
      OnExit = DBENombreExit
    end
    object DBEFPais: TLFDBEditFind2000
      Left = 60
      Top = 233
      Width = 63
      Height = 21
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'PAIS'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 12
      OnChange = DBEFPaisChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'SYS_PAISES'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'PAIS'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OrdenadoPor.Strings = (
        'PAIS')
      Filtros = []
      Entorno = DMFacturas.EntornoDoc
    end
    object ETituloPais: TLFEdit
      Left = 124
      Top = 233
      Width = 366
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object DBELocalidad: TLFDbedit
      Left = 208
      Top = 167
      Width = 282
      Height = 21
      DataField = 'LOCALIDAD'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 9
    end
    object DBETelefono01: TLFDbedit
      Left = 60
      Top = 255
      Width = 101
      Height = 21
      DataField = 'TELEFONO01'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 14
    end
    object DBETelefono02: TLFDbedit
      Left = 224
      Top = 255
      Width = 101
      Height = 21
      DataField = 'TELEFONO02'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 15
    end
    object DBETelefax: TLFDbedit
      Left = 385
      Top = 255
      Width = 105
      Height = 21
      DataField = 'TELEFAX'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 16
    end
    object DBEEmail: TLFDbedit
      Left = 60
      Top = 277
      Width = 430
      Height = 21
      DataField = 'EMAIL'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 17
    end
    object DBMNotas: TLFDBMemo
      Left = 60
      Top = 299
      Width = 197
      Height = 59
      DataField = 'NOTAS'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 18
    end
    object DBEColonia: TLFDbedit
      Left = 60
      Top = 211
      Width = 282
      Height = 21
      DataField = 'COLONIA'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 11
    end
    object PNLRellenarDatos: TLFPanel
      Left = 198
      Top = 52
      Width = 292
      Height = 22
      BevelOuter = bvNone
      TabOrder = 22
      Visible = False
      object SBRellenarDatos: TSpeedButton
        Left = 0
        Top = 0
        Width = 73
        Height = 22
        Hint = 'Rellenar con datos anteriormente entrados'
        Caption = 'Rellenar'
        ParentShowHint = False
        ShowHint = True
        OnClick = SBRellenarDatosClick
      end
      object LRellenarDatos: TLFLabel
        Left = 75
        Top = 4
        Width = 130
        Height = 13
        Caption = 'Existen datos para esto NIF'
      end
    end
    object PNLFirma: TLFPanel
      Left = 306
      Top = 300
      Width = 185
      Height = 59
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 23
      DesignSize = (
        185
        59)
      object ImgFirma: TImage
        Left = 0
        Top = 0
        Width = 185
        Height = 59
        Align = alClient
        Center = True
        Proportional = True
        Stretch = True
        OnDblClick = ImgFirmaDblClick
      end
      object DBTFirmaNombre: TDBText
        Left = 0
        Top = 33
        Width = 185
        Height = 13
        Anchors = [akLeft, akRight, akBottom]
        Color = clBtnFace
        DataField = 'NOMBRE'
        DataSource = DSQMFirmas
        ParentColor = False
        Transparent = True
      end
      object DBTNIFFirma: TDBText
        Left = 0
        Top = 46
        Width = 185
        Height = 13
        Anchors = [akLeft, akRight, akBottom]
        DataField = 'NIF'
        DataSource = DSQMFirmas
        Transparent = True
      end
    end
    object SBRefrescarFirma: TBitBtn
      Left = 279
      Top = 319
      Width = 23
      Height = 22
      Action = ARefrescarImagenFirma
      Caption = ' '
      TabOrder = 19
    end
    object DBENombreContacto: TLFDbedit
      Left = 60
      Top = 123
      Width = 311
      Height = 21
      DataField = 'NOMBRE_CONTACTO'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 5
    end
    object CBGrabaCrmContacto: TCheckBox
      Left = 373
      Top = 125
      Width = 120
      Height = 16
      Caption = 'Graba Crm Contacto'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object DBLCComoNosConocieron: TRxDBLookupCombo
      Left = 98
      Top = 359
      Width = 395
      Height = 21
      DropDownCount = 12
      DataField = 'COMO_NOS_CONOCIERON'
      DataSource = DMFacturas.DSQMNIF
      LookupField = 'MODO'
      LookupDisplay = 'TITULO'
      LookupSource = DSQMComoNosConocieron
      TabOrder = 20
    end
    object DBEFPaisDocIdent: TLFDBEditFind2000
      Left = 60
      Top = 74
      Width = 63
      Height = 21
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'PAIS_DOC_IDENT'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 2
      OnExit = DBEFPaisDocIdentExit
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'SYS_PAISES'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'PAIS'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OrdenadoPor.Strings = (
        'PAIS')
      Filtros = []
      Entorno = DMFacturas.EntornoDoc
    end
    object DBEFTipoDocIdent: TLFDBEditFind2000
      Left = 181
      Top = 74
      Width = 51
      Height = 21
      DataField = 'TIPO_DOC_IDENT'
      DataSource = DMFacturas.DSQMNIF
      TabOrder = 3
      OnChange = DBEFTipoDocIdentChange
      OnExit = DBEFPaisDocIdentExit
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'SYS_TIPO_DOC_IDENT_PAIS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'TIPO_DOC_IDENT'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OnBusqueda = DBEFTipoDocIdentBusqueda
      Filtros = []
    end
    object ETipoDocumentoTitulo: TLFEdit
      Left = 233
      Top = 74
      Width = 257
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  inherited TBActions: TLFToolBar
    Top = 388
    Width = 504
  end
  inherited CEMain: TControlEdit
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 320
    Top = 0
    inherited CEMainMifirst: TMenuItem
      ShortCut = 16450
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 16465
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 16471
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 16457
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 16454
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 16460
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 16451
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 16472
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 16470
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 16499
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
    Left = 360
    Top = 0
    object AImprimirCartaLOPD: TAction
      Category = 'LOPD'
      Caption = 'Imprimir Carta LOPD'
      Hint = 'Imprimir Carta LOPD'
      ImageIndex = 14
      OnExecute = AImprimirCartaLOPDExecute
    end
    object AVisualizarCartaLOPD: TAction
      Category = 'LOPD'
      Caption = 'Visualizar Carta LOPD'
      Hint = 'Visualizar Carta LOPD'
      ImageIndex = 125
      OnExecute = AVisualizarCartaLOPDExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'LOPD'
      Caption = 'LOPD'
      Hint = 'LOPD'
      ImageIndex = 125
    end
    object AEnviarEmailCartaLOPD: TAction
      Category = 'LOPD'
      Caption = 'Enviar por email Carta LOPD (Directo)'
      Hint = 'Enviar por email Carta LOPD (Directo)'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaLOPDExecute
    end
    object AEnviarEmailCartaLOPD2: TAction
      Category = 'LOPD'
      Caption = 'Enviar por email Carta LOPD (Mensaje)'
      Hint = 'Enviar por email Carta LOPD (Mensaje)'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaLOPD2Execute
    end
    object APedirFirma: TAction
      Category = 'LOPD'
      Caption = 'Pedir Firma'
      Hint = 'Pedir Firma'
      ImageIndex = 124
      OnExecute = APedirFirmaExecute
    end
    object ABorrarFirma: TAction
      Category = 'LOPD'
      Caption = 'Borrar Firma'
      Hint = 'Borrar Firma'
      ImageIndex = 124
      OnExecute = ABorrarFirmaExecute
    end
    object ARefrescarImagenFirma: TAction
      Category = 'LOPD'
      Caption = 'Refrescar Imagen Firma'
      Hint = 'Refrescar Imagen Firma'
      ImageIndex = 26
      OnExecute = ARefrescarImagenFirmaExecute
    end
    object AGuardarComoAdjunto: TAction
      Category = 'LOPD'
      Caption = 'Guardar como Adjunto'
      Hint = 'Guardar como Adjunto del documento'
      ImageIndex = 41
      OnExecute = AGuardarComoAdjuntoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Maestros'
      Caption = 'Maestros'
      ImageIndex = 135
    end
    object ACrearTercero: TAction
      Category = 'Maestros'
      Caption = 'Crear/Actualizar Tercero'
      Hint = 'Actualizar datos de tercero'
      ImageIndex = 54
      OnExecute = ACrearTerceroExecute
    end
    object ACrearCliente: TAction
      Category = 'Maestros'
      Caption = 'Crear Cliente'
      Hint = 'Crear un cliente y utilizarlo en el documento'
      ImageIndex = 104
      OnExecute = ACrearClienteExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 392
    Top = 0
  end
  object QMFirmas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ID_FIRMA, NOMBRE, NIF'
      'FROM GES_FIRMAS'
      'WHERE'
      'TIPO = :TIPO AND'
      'ID_DOC = :ID_DOC AND'
      'OCTET_LENGTH(COALESCE(FIRMA, '#39#39')) > 10'
      'ORDER BY ID_FIRMA')
    UniDirectional = False
    Left = 464
    Top = 128
    object QMFirmasID_FIRMA: TIntegerField
      DisplayLabel = 'Id Firma'
      FieldName = 'ID_FIRMA'
    end
    object QMFirmasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMFirmasNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
  end
  object DSQMFirmas: TDataSource
    DataSet = QMFirmas
    Left = 464
    Top = 160
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 472
    Top = 8
  end
  object QMComoNosConocieron: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_COMO_NOS_CONOCIERON'
      'ORDER BY MODO')
    UniDirectional = False
    Left = 432
    Top = 128
    object QMComoNosConocieronMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object QMComoNosConocieronTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMComoNosConocieron: TDataSource
    DataSet = QMComoNosConocieron
    Left = 432
    Top = 160
  end
  object xValidacionDoc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_DIRECCION'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT RESULTADO, RESULTADO_NOMBRE, FECHA_COMPROBACION'
      'FROM VALIDACION_DOCUMENTO'
      'WHERE'
      'PAIS = :PAIS AND'
      'TIPO_DOC_IDENT = :TIPO_DOC_IDENT AND'
      'DOCUMENTO = :NIF')
    UniDirectional = False
    AfterOpen = xValidacionDocAfterOpen
    Left = 400
    Top = 128
    object xValidacionDocRESULTADO: TFIBStringField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
      Size = 35
    end
    object xValidacionDocRESULTADO_NOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'RESULTADO_NOMBRE'
      Size = 256
    end
    object xValidacionDocFECHA_COMPROBACION: TDateTimeField
      DisplayLabel = 'Fec. Comprobacion'
      FieldName = 'FECHA_COMPROBACION'
    end
  end
  object DSxValidacionDoc: TDataSource
    DataSet = xValidacionDoc
    Left = 400
    Top = 160
  end
  object TmrValidacion: TTimer
    Interval = 5000
    OnTimer = TmrValidacionTimer
    Left = 424
  end
end
