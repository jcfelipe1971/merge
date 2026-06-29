object FAcerca: TFAcerca
  Left = 412
  Top = 140
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Acerca de ...'
  ClientHeight = 473
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrBImagen: TScrollBox
    Left = 0
    Top = 0
    Width = 692
    Height = 137
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    AutoScroll = False
    BorderStyle = bsNone
    TabOrder = 0
    object Imagen: TImage
      Left = 0
      Top = 0
      Width = 692
      Height = 137
      Align = alClient
      AutoSize = True
      Center = True
      IncrementalDisplay = True
    end
  end
  object PCMain: TLFPageControl
    Left = 0
    Top = 137
    Width = 692
    Height = 299
    ActivePage = TSAcerca
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 1
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSAcerca: TTabSheet
      Caption = 'Acerca'
      object PNLEspe: TLFPanel
        Left = 0
        Top = 0
        Width = 684
        Height = 271
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object PNLRevisiones: TLFPanel
          Left = 557
          Top = 0
          Width = 127
          Height = 271
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object Z_LblBBDD: TLFLabel
            Left = 0
            Top = 0
            Width = 127
            Height = 13
            Align = alTop
            Alignment = taCenter
            Caption = 'Base de Datos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBGVersiones: TDBGrid
            Left = 0
            Top = 13
            Width = 127
            Height = 258
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            Ctl3D = False
            DataSource = DSFIBVersiones
            Options = [dgColLines, dgRowLines, dgRowSelect, dgCancelOnExit]
            ParentCtl3D = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGVersionesDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'TIPO_REVISION'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ACTUALIZACION'
                Width = 50
                Visible = True
              end>
          end
        end
        object PNLDatos: TLFPanel
          Left = 0
          Top = 0
          Width = 557
          Height = 271
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object PNLDatosSistema: TLFPanel
            Left = 0
            Top = 116
            Width = 557
            Height = 155
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LBLSistema: TLFLabel
              Left = 8
              Top = 2
              Width = 345
              Height = 15
              AutoSize = False
              Caption = 'Sistema'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LBLMemoria: TLFLabel
              Left = 28
              Top = 16
              Width = 90
              Height = 13
              Alignment = taRightJustify
              Caption = 'Memoria disponible'
            end
            object LBLMem: TLFLabel
              Left = 125
              Top = 16
              Width = 95
              Height = 13
              Caption = '%d KB de %d KB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LDireccionIP: TLFLabel
              Left = 60
              Top = 32
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'Direccion IP'
            end
            object LTDireccionIP: TLFLabel
              Left = 125
              Top = 32
              Width = 71
              Height = 13
              Caption = 'Direccion IP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LDireccionIPPublica: TLFLabel
              Left = 22
              Top = 48
              Width = 96
              Height = 13
              Alignment = taRightJustify
              Caption = 'Direccion IP P'#250'blica'
            end
            object LTDireccionIPPublica: TLFLabel
              Left = 125
              Top = 48
              Width = 117
              Height = 13
              Caption = 'Direccion IP P'#250'blica'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LMACServidor: TLFLabel
              Left = 53
              Top = 64
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'MAC Servidor'
            end
            object LTMACServidor: TLFLabel
              Left = 125
              Top = 64
              Width = 78
              Height = 13
              Caption = 'MAC Servidor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
            end
            object LLicencia: TLFLabel
              Left = 78
              Top = 80
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Licencia'
            end
            object LTLicencia: TLFLabel
              Left = 125
              Top = 80
              Width = 49
              Height = 13
              Caption = 'Licencia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
            end
            object LTCorreoLicencia: TLFLabel
              Left = 125
              Top = 94
              Width = 90
              Height = 13
              Caption = 'Correo Licencia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
            end
            object LCorreoLicencia: TLFLabel
              Left = 44
              Top = 94
              Width = 74
              Height = 13
              Alignment = taRightJustify
              Caption = 'Correo Licencia'
            end
            object LTLocalAppData: TLFLabel
              Left = 125
              Top = 110
              Width = 78
              Height = 13
              Caption = 'LocaAppData'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object LLocalAppData: TLFLabel
              Left = 52
              Top = 110
              Width = 66
              Height = 13
              Alignment = taRightJustify
              Caption = 'LocaAppData'
            end
            object LAppData: TLFLabel
              Left = 76
              Top = 126
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'AppData'
            end
            object LTAppData: TLFLabel
              Left = 125
              Top = 126
              Width = 50
              Height = 13
              Caption = 'AppData'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
          end
          object PNLDatosEjecutable: TLFPanel
            Left = 0
            Top = 0
            Width = 557
            Height = 116
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object LBLVersionBD: TLFLabel
              Left = 10
              Top = 22
              Width = 108
              Height = 13
              Alignment = taRightJustify
              Caption = 'Versi'#243'n Base de Datos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object LBLTVersionEXE: TLFLabel
              Left = 125
              Top = 38
              Width = 128
              Height = 13
              Caption = 'Versi'#243'n del Ejecutable'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LBLTVersionBD: TLFLabel
              Left = 125
              Top = 22
              Width = 130
              Height = 13
              Caption = 'Versi'#243'n Base de Datos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LBLTCompilacion: TLFLabel
              Left = 125
              Top = 54
              Width = 69
              Height = 13
              Caption = 'Compilacion'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LBLTNombreProducto: TLFLabel
              Left = 125
              Top = 6
              Width = 120
              Height = 13
              Caption = 'Nombre del Producto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LBLTEmpresa: TLFLabel
              Left = 125
              Top = 69
              Width = 49
              Height = 13
              Caption = 'Empresa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LBLTCopyRight: TLFLabel
              Left = 125
              Top = 85
              Width = 54
              Height = 13
              Caption = 'Copyright'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LBLCompilacion: TLFLabel
              Left = 61
              Top = 54
              Width = 57
              Height = 13
              Alignment = taRightJustify
              Caption = 'Compilacion'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object LBLNombreProducto: TLFLabel
              Left = 18
              Top = 6
              Width = 100
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nombre del Producto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object LBLEmpresa: TLFLabel
              Left = 77
              Top = 69
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Empresa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object LBLCopyRight: TLFLabel
              Left = 74
              Top = 85
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Copyright'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object LVersionEjecutable: TLFLabel
              Left = 13
              Top = 38
              Width = 105
              Height = 13
              Alignment = taRightJustify
              Caption = 'Versi'#243'n del Ejecutable'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object LEntrada: TLFLabel
              Left = 81
              Top = 102
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Entrada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object LBLEntrada: TLFLabel
              Left = 125
              Top = 102
              Width = 45
              Height = 13
              Caption = 'Entrada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
    end
    object TSDeclResponsable: TTabSheet
      Caption = 'Declaracion Responsable'
      ImageIndex = 1
      object PNLDeclResponsable: TLFPanel
        Left = 0
        Top = 0
        Width = 684
        Height = 271
        Align = alClient
        TabOrder = 0
        object REDeclResponsable: TRichEdit
          Left = 1
          Top = 1
          Width = 682
          Height = 269
          Align = alClient
          Color = clInfoBk
          Lines.Strings = (
            'DECLARACI'#211'N RESPONSABLE DEL SISTEMA INFORM'#193'TICO DE FACTURACI'#211'N'
            ''
            'INFORMACI'#211'N:'
            ''
            'a) Nombre del sistema inform'#225'tico de facturaci'#243'n: @sistema.'
            ''
            
              'b) C'#243'digo identificador del sistema inform'#225'tico de facturaci'#243'n: ' +
              '@identificador.'
            ''
            
              'c) Identificador completo de la versi'#243'n actual del sistema infor' +
              'm'#225'tico de facturaci'#243'n: @version.'
            ''
            
              'd) Componentes, hardware y software, de que consta el sistema in' +
              'form'#225'tico de facturaci'#243'n: Software de gestion de empresa.'
            ''
            
              'e) El presente sistema inform'#225'tico de facturaci'#243'n funciona exclu' +
              'sivamente en la modalidad "VERI*FACTU".'
            ''
            
              'f) El presente sistema inform'#225'tico de facturaci'#243'n permite ser us' +
              'ado por varios obligados tributarios, o por un mismo usuario par' +
              'a dar soporte a '
            'la facturaci'#243'n de varios obligados tributarios.'
            ''
            
              'g) El presente sistema inform'#225'tico de facturaci'#243'n, al funcionar ' +
              'exclusivamente en la modalidad "VERI*FACTU", al no estar obligad' +
              'o a ello no '
            
              'firma los registros de facturaci'#243'n. Se utiliza el certificado di' +
              'gital propio del obligado tributario exclusivamente para identif' +
              'icarse en el env'#237'o de '
            'los registros de facturaci'#243'n a la Agencia Tributaria.'
            ''
            
              'h) Raz'#243'n social de la entidad productora del sistema inform'#225'tico' +
              ' de facturaci'#243'n: @razon_social.'
            ''
            
              'i) N'#250'mero de identificaci'#243'n fiscal de la entidad productora del ' +
              'sistema inform'#225'tico de facturaci'#243'n: @nif.'
            ''
            
              'j) Direcci'#243'n postal de la entidad productora del sistema inform'#225 +
              'tico de facturaci'#243'n: @direccion.'
            ''
            
              'k) La entidad productora del sistema inform'#225'tico de facturaci'#243'n,' +
              ' hace constar que el presente sistema, en su versi'#243'n actual, cum' +
              'ple con lo '
            
              'dispuesto en el art'#237'culo 29.2.j) de la Ley 58/2003, de 17 de dic' +
              'iembre, General Tributaria, en el Reglamento que establece los r' +
              'equisitos '
            
              'que deben adoptar los sistemas y programas inform'#225'ticos o electr' +
              #243'nicos que soporten los procesos de facturaci'#243'n de empresarios y' +
              ' '
            
              'profesionales, y la estandarizaci'#243'n de formatos de los registros' +
              ' de facturaci'#243'n, aprobado por el Real Decreto 1007/2003, de 5 de' +
              ' diciembre, '
            
              'en esta orden y en la sede electr'#243'nica de la Agencia Estatal de ' +
              'Administraci'#243'n Tributaria para todo aquello que complete las '
            'especificaciones de esta orden.'
            ''
            
              'l) La entidad productora del sistema inform'#225'tico de facturaci'#243'n,' +
              ' suscribe la presente declaraci'#243'n en @lugar a @fecha.'
            ''
            'INFORMACI'#211'N ADICIONAL:'
            ''
            
              'a) Otras formas de contacto con la entidad productora del sistem' +
              'a inform'#225'tico de facturaci'#243'n: @email, @telefono, @whatsapp'
            ''
            
              'b) P'#225'gina web de la entidad prodcutora del sistema inform'#225'tico d' +
              'e facturaci'#243'n: @web'
            ''
            
              'c) Explicaci'#243'n detallada de c'#243'mo cumple el presente sistema info' +
              'rm'#225'tico de facturaci'#243'n las diferentes especificaciones t'#233'cnicas ' +
              'y '
            'funcionales:'
            '(A DESARROLLAR)'
            ''
            'd) Informaci'#243'n adicional de inter'#233's '
            '(A DESARROLLAR) ')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  object PNLBoton: TLFPanel
    Left = 0
    Top = 436
    Width = 692
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BBSalir: TBitBtn
      Left = 304
      Top = 4
      Width = 80
      Height = 30
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object FIBVersiones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from DAME_ACTUALIZACIONES'
      'where tipo_revision<>'#39'HYA'#39' and tipo_revision<>'#39'GK2'#39)
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 64
    Top = 24
    object FIBVersionesTIPO_REVISION: TFIBStringField
      DisplayLabel = 'Tipo Rev.'
      FieldName = 'TIPO_REVISION'
      Size = 3
    end
    object FIBVersionesACTUALIZACION: TIntegerField
      DisplayLabel = 'Actualizacion'
      FieldName = 'ACTUALIZACION'
    end
  end
  object DSFIBVersiones: TDataSource
    AutoEdit = False
    DataSet = FIBVersiones
    Left = 140
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 200
    Top = 24
  end
  object TimerActualizaMemoria: TTimer
    OnTimer = TimerActualizaMemoriaTimer
    Left = 64
    Top = 68
  end
end
