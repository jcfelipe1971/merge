object CrmFMConfiguracion: TCrmFMConfiguracion
  Left = 605
  Top = 260
  ActiveControl = LFDBNombre
  BorderStyle = bsDialog
  Caption = 'Configuraci'#243'n CRM'
  ClientHeight = 449
  ClientWidth = 637
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
  object TBConf: TLFToolBar
    Left = 0
    Top = 0
    Width = 637
    Height = 22
    AutoSize = True
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 80
      Height = 22
      DataSource = CrmDMConfiguracion.DSQMCrmConfig
      VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      EditaControl = LFDBNombre
      Exclusivo = True
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object ToolButton1: TToolButton
      Left = 80
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtSalir: TToolButton
      Left = 88
      Top = 0
      Caption = '&Salir'
      ImageIndex = 0
      OnClick = TButtSalirClick
    end
    object TBAsignarImagen: TToolButton
      Left = 111
      Top = 0
      Hint = 'Asignar imagen'
      Caption = 'Asignar Imagen'
      ImageIndex = 28
      ParentShowHint = False
      ShowHint = True
      OnClick = TBAsignarImagenClick
    end
  end
  object PCMain: TLFPanel
    Left = 0
    Top = 22
    Width = 637
    Height = 427
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object LFPCMain: TLFPageControl
      Left = 0
      Top = 0
      Width = 637
      Height = 427
      ActivePage = TSConfiguracion
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      OnChange = LFPCMainChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSConfiguracion: TTabSheet
        Caption = 'Configuraci'#243'n'
        ImageIndex = 2
        OnShow = TSConfiguracionShow
        object LNombre: TLFLabel
          Left = 60
          Top = 16
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nombre'
        end
        object LDireccion: TLFLabel
          Left = 52
          Top = 37
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Direcci'#243'n'
        end
        object LCodigoPostal: TLFLabel
          Left = 83
          Top = 60
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = 'CP'
        end
        object LCiudad: TLFLabel
          Left = 157
          Top = 60
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ciudad'
        end
        object LProvincia: TLFLabel
          Left = 53
          Top = 82
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Provincia'
        end
        object LPais: TLFLabel
          Left = 231
          Top = 80
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pa'#237's'
        end
        object LTelefono: TLFLabel
          Left = 55
          Top = 102
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tel'#233'fono'
        end
        object LEmail: TLFLabel
          Left = 71
          Top = 127
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = 'Email'
        end
        object LWeb: TLFLabel
          Left = 74
          Top = 150
          Width = 23
          Height = 13
          Alignment = taRightJustify
          Caption = 'Web'
        end
        object LFax: TLFLabel
          Left = 236
          Top = 103
          Width = 17
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fax'
        end
        object LFDBNombre: TLFDbedit
          Left = 102
          Top = 12
          Width = 291
          Height = 21
          DataField = 'CRM_NOMBRE'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 0
        end
        object LFDDireccion: TLFDbedit
          Left = 102
          Top = 34
          Width = 291
          Height = 21
          DataField = 'CRM_DIRECCION'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 1
        end
        object LFDbCP: TLFDbedit
          Left = 102
          Top = 56
          Width = 50
          Height = 21
          DataField = 'CRM_CP'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 2
        end
        object LFDbCiudad: TLFDbedit
          Left = 197
          Top = 56
          Width = 196
          Height = 21
          DataField = 'CRM_CIUDAD'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 3
        end
        object LFDbProvincia: TLFDbedit
          Left = 102
          Top = 78
          Width = 121
          Height = 21
          DataField = 'CRM_PROVINCIA'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 4
        end
        object LFDbPais: TLFDbedit
          Left = 256
          Top = 78
          Width = 137
          Height = 21
          DataField = 'CRM_PAIS'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 5
        end
        object LFDbTelefono: TLFDbedit
          Left = 102
          Top = 100
          Width = 121
          Height = 21
          DataField = 'CRM_TELEFONO'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 6
        end
        object LFDbEmail: TLFDbedit
          Left = 102
          Top = 122
          Width = 291
          Height = 21
          DataField = 'CRM_EMAIL'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 8
        end
        object LFDbWeb: TLFDbedit
          Left = 102
          Top = 144
          Width = 291
          Height = 21
          DataField = 'CRM_WEB'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 9
        end
        object LFDbFax: TLFDbedit
          Left = 256
          Top = 100
          Width = 137
          Height = 21
          DataField = 'CRM_FAX'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 7
        end
        object LFImatge: TLFPanel
          Left = 403
          Top = 12
          Width = 210
          Height = 159
          Align = alCustom
          BevelOuter = bvNone
          TabOrder = 10
          object CRMImatge: TImage
            Left = 0
            Top = 0
            Width = 210
            Height = 159
            Align = alClient
            Stretch = True
          end
        end
        object LFDBDireccionAm: TLFDBMemo
          Left = 402
          Top = 184
          Width = 213
          Height = 110
          DataField = 'CRM_DIRECCION_AMPLIADA'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 11
          Visible = False
        end
      end
      object TSCrm: TTabSheet
        Caption = 'CRM'
        object LTipoLetra: TLFLabel
          Left = 13
          Top = 34
          Width = 116
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de letra por defecto'
        end
        object LTamanoLetra: TLFLabel
          Left = 41
          Top = 57
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tama'#241'o de la letra'
        end
        object LTipoAccionPorDefecto: TLFLabel
          Left = 16
          Top = 79
          Width = 113
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo acci'#243'n por defecto'
        end
        object FontSize: TLFDbedit
          Left = 134
          Top = 53
          Width = 35
          Height = 21
          Hint = 'Tama'#241'o de fuente'
          DataField = 'CRM_TAMANO_LETRA'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 1
        end
        object FontName: TDBComboBox
          Left = 134
          Top = 31
          Width = 195
          Height = 21
          Hint = 'Fuente'
          Ctl3D = False
          DataField = 'CRM_TIPO_LETRA'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          DropDownCount = 10
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 0
        end
        object LFCBAccion: TLFDBCheckBox
          Left = 133
          Top = 105
          Width = 178
          Height = 17
          Caption = 'Creaci'#243'n autom'#225'tica de la acci'#243'n'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'CRM_AUTO_ACCION'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object CBTAccion: TDBComboBox
          Left = 134
          Top = 75
          Width = 107
          Height = 21
          Hint = 'Fuente'
          Ctl3D = False
          DataField = 'CRM_ACCION_DEFECTO'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          DropDownCount = 10
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 3
        end
        object CBAvisos: TLFDBCheckBox
          Left = 133
          Top = 122
          Width = 112
          Height = 17
          Caption = 'Aviso Seguimientos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'CRM_AVISOS'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object TSHTMLCliente: TTabSheet
        Caption = 'HTML Cliente'
        ImageIndex = 1
        object LFDBHTMLCliente: TLFDBMemo
          Left = 0
          Top = 0
          Width = 629
          Height = 399
          Align = alClient
          DataField = 'HTML_CLIENTE'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 0
        end
      end
      object TSHTMLContacto: TTabSheet
        Caption = 'HTML Contacto'
        ImageIndex = 23
        object LFDBHTMLContacto: TLFDBMemo
          Left = 0
          Top = 0
          Width = 629
          Height = 399
          Align = alClient
          DataField = 'HTML_CONTACTO'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 0
        end
      end
      object TSHTMLContactos: TTabSheet
        Caption = 'HTML Contactos'
        ImageIndex = 3
        object LFDBHTMLContactos: TLFDBMemo
          Left = 0
          Top = 0
          Width = 629
          Height = 399
          Align = alClient
          DataField = 'HTML_CONTACTOS'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 0
        end
      end
      object TSHTMLEmpresa: TTabSheet
        Caption = 'HTML Empresa'
        object LFDBHTMLEmpresa: TLFDBMemo
          Left = 0
          Top = 0
          Width = 629
          Height = 399
          Align = alClient
          DataField = 'HTML_EMPRESA'
          DataSource = CrmDMConfiguracion.DSQMCrmConfig
          TabOrder = 0
        end
      end
      object TSTPV: TTabSheet
        Caption = 'TPV'
        object GBImpresora: TGroupBox
          Left = 16
          Top = 13
          Width = 205
          Height = 80
          Caption = 'Impresora'
          TabOrder = 0
          object LFNombreImpresora: TLFLabel
            Left = 8
            Top = 51
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LFIP: TLFLabel
            Left = 35
            Top = 27
            Width = 10
            Height = 13
            Alignment = taRightJustify
            Caption = 'IP'
          end
          object LFDIPImpresora: TLFDbedit
            Left = 49
            Top = 24
            Width = 88
            Height = 21
            DataField = 'CRM_IP_IMPRESORA'
            DataSource = CrmDMConfiguracion.DSQMCrmConfig
            TabOrder = 0
          end
          object LFDNombreImpresora: TLFDbedit
            Left = 49
            Top = 46
            Width = 135
            Height = 21
            DataField = 'CRM_NOMBRE_IMPRESORA'
            DataSource = CrmDMConfiguracion.DSQMCrmConfig
            TabOrder = 1
          end
        end
      end
    end
  end
  object OPImagen: TOpenPictureDialog
    Left = 560
    Top = 52
  end
end
