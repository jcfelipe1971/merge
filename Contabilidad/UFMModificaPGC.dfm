object FMModificaPGC: TFMModificaPGC
  Left = 420
  Top = 173
  Width = 718
  Height = 361
  Caption = 'Modifica PGC'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PGeneral: TLFPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 334
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PEdit: TLFPanel
      Left = 0
      Top = 0
      Width = 710
      Height = 237
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object G2KTableLoc: TG2KTBLoc
        Left = 64
        Top = 40
        Hint = 'Localizar'
        ImageIndex = 81
        Filtros = []
      end
      object LCanal: TLFLabel
        Left = 294
        Top = 68
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Canal'
      end
      object LFechaApertura: TLFLabel
        Left = 177
        Top = 94
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'F. Apertura'
      end
      object LFechaCierre: TLFLabel
        Left = 19
        Top = 94
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'F.Cierre'
      end
      object LFechaActivacion: TLFLabel
        Left = 355
        Top = 94
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'F. Activaci'#243'n'
      end
      object LPGCActual: TLFLabel
        Left = 23
        Top = 160
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'P.G.C.'
      end
      object LDAtosEmpresaEjercicioCanal: TLFLabel
        Left = 19
        Top = 20
        Width = 191
        Height = 13
        Caption = 'Datos Empresa - Ejercicio - Canal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LPlanGeneralContableNuevo: TLFLabel
        Left = 19
        Top = 183
        Width = 169
        Height = 13
        Caption = 'Plan General Contable Nuevo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LVerificarDatos: TLFLabel
        Left = 214
        Top = 20
        Width = 75
        Height = 13
        Caption = '(Verificar Datos)'
      end
      object LPlanGeneralContableActual: TLFLabel
        Left = 19
        Top = 139
        Width = 168
        Height = 13
        Caption = 'Plan General Contable Actual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LPGCNuevo: TLFLabel
        Left = 23
        Top = 205
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'P.G.C.'
      end
      object DBEEjercicio: TLFDbedit
        Left = 19
        Top = 65
        Width = 86
        Height = 21
        Color = clInfoBk
        DataField = 'EJERCICIO'
        DataSource = DMModificaPGC.DSQMEmpCanales
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBECanal: TLFDbedit
        Left = 326
        Top = 65
        Width = 43
        Height = 21
        Color = clInfoBk
        DataField = 'CANAL'
        DataSource = DMModificaPGC.DSQMEmpCanales
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBETitCanal: TLFDbedit
        Left = 370
        Top = 65
        Width = 159
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMModificaPGC.DSxCanales
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEApertura: TLFDbedit
        Left = 234
        Top = 91
        Width = 109
        Height = 21
        Color = clInfoBk
        DataField = 'APERTURA'
        DataSource = DMModificaPGC.DSQMEmpCanales
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBECierre: TLFDbedit
        Left = 60
        Top = 91
        Width = 109
        Height = 21
        Color = clInfoBk
        DataField = 'CIERRE'
        DataSource = DMModificaPGC.DSQMEmpCanales
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEActivacion: TLFDbedit
        Left = 422
        Top = 91
        Width = 107
        Height = 21
        Color = clInfoBk
        DataField = 'ACTIVACION'
        DataSource = DMModificaPGC.DSQMEmpCanales
        Enabled = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBETitPais: TLFDbedit
        Left = 106
        Top = 65
        Width = 183
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMModificaPGC.DSxPaises
        Enabled = False
        ReadOnly = True
        TabOrder = 6
      end
      object EBEFindPGC: TLFDBEditFind2000
        Left = 59
        Top = 156
        Width = 42
        Height = 21
        Color = clInfoBk
        DataField = 'PGC'
        DataSource = DMModificaPGC.DSQMEmpCanales
        Enabled = False
        ReadOnly = True
        TabOrder = 7
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'SYS_PLANES_CONTABLES'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'PGC'
        CampoStr = 'TITULO'
        ReemplazarCaracter = True
        SalirSiNoExiste = False
        SalirSiVacio = False
        Filtros = []
      end
      object DBEPGC: TLFDbedit
        Left = 102
        Top = 156
        Width = 425
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMModificaPGC.DSxPGC
        Enabled = False
        ReadOnly = True
        TabOrder = 8
      end
      object DBEEmpresa: TLFDbedit
        Left = 19
        Top = 39
        Width = 86
        Height = 21
        Color = clInfoBk
        DataField = 'EMPRESA'
        DataSource = DMModificaPGC.DSQMSysEmpresas
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object DBETitulo: TLFDbedit
        Left = 106
        Top = 39
        Width = 423
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMModificaPGC.DSQMSysEmpresas
        Enabled = False
        TabOrder = 10
      end
      object ScrBImagen: TScrollBox
        Left = 549
        Top = 11
        Width = 144
        Height = 130
        HorzScrollBar.Visible = False
        VertScrollBar.Visible = False
        AutoScroll = False
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 11
        object Imagen: TImage
          Left = 0
          Top = 0
          Width = 144
          Height = 130
          Align = alClient
          AutoSize = True
          IncrementalDisplay = True
          Stretch = True
        end
      end
      object BtnModifica: TBitBtn
        Left = 552
        Top = 156
        Width = 139
        Height = 66
        Caption = 'Modificar PGC'
        Default = True
        Enabled = False
        ModalResult = 1
        TabOrder = 12
        Visible = False
        OnClick = BtnModificaClick
        NumGlyphs = 2
        Style = bsNew
      end
      object EBEFindPGCN: TLFEditFind2000
        Left = 59
        Top = 201
        Width = 42
        Height = 21
        TabOrder = 13
        OnChange = EBEFindPGCNChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PGC'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_PLANES_CONTABLES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EBEFindPGCNBusqueda
        OrdenadoPor.Strings = (
          'PGC')
        Filtros = [obPais]
        Entorno = DMMain.EntornoBusqueda
      end
      object LFEPGCNTitulo: TLFEdit
        Left = 102
        Top = 201
        Width = 424
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 14
      end
      object BtnMail: TBitBtn
        Left = 552
        Top = 156
        Width = 139
        Height = 66
        Caption = 'Enviar por eMail'
        Default = True
        Enabled = False
        ModalResult = 1
        TabOrder = 15
        Visible = False
        OnClick = BtnMailClick
        NumGlyphs = 2
        Style = bsNew
      end
    end
    object PInformacion: TLFPanel
      Left = 0
      Top = 237
      Width = 710
      Height = 97
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object MemoInfo: TLFMemo
        Left = 0
        Top = 9
        Width = 710
        Height = 88
        Align = alClient
        Color = clInfoBk
        ScrollBars = ssVertical
        TabOrder = 0
        WordWrap = False
      end
      object PSeparador: TLFPanel
        Left = 0
        Top = 0
        Width = 710
        Height = 9
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
  end
end
