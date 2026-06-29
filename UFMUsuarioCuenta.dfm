object FMUsuarioCuenta: TFMUsuarioCuenta
  Left = 486
  Top = 199
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cambiar clave usuario'
  ClientHeight = 213
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PNMain: TLFPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 213
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 392
      Height = 25
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavMain: THYMNavigator
        Left = 0
        Top = 0
        Width = 46
        Height = 22
        DataSource = DMUsuarioCuenta.DSQMUsuario
        VisibleButtons = [nbPost, nbCancel]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 0
        BeforeAction = NavMainBeforeAction
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
    end
    object PNUsuario: TLFPanel
      Left = 0
      Top = 25
      Width = 392
      Height = 188
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LBLNombre: TLFLabel
        Left = 51
        Top = 31
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nombre'
      end
      object LBLFechaCambioPassw: TLFLabel
        Left = 179
        Top = 141
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Ultimo Cambio'
      end
      object LBLClave: TLFLabel
        Left = 61
        Top = 53
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Clave'
      end
      object LBLNombreCorreo: TLFLabel
        Left = 17
        Top = 97
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nombre Correo'
      end
      object LBLDirCorreo: TLFLabel
        Left = 61
        Top = 119
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'e-mail'
      end
      object LBLDiasCaducidad: TLFLabel
        Left = 11
        Top = 141
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'D'#237'as Caducidad'
      end
      object LBLClaveConfirm: TLFLabel
        Left = 15
        Top = 75
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Confirmar clave'
      end
      object DBEClave: TLFDbedit
        Left = 93
        Top = 49
        Width = 277
        Height = 21
        DataField = 'CLAVE'
        DataSource = DMUsuarioCuenta.DSQMUsuario
        PasswordChar = '*'
        TabOrder = 0
        OnChange = DBEClaveChange
      end
      object DBENombreCorreo: TLFDbedit
        Left = 93
        Top = 93
        Width = 277
        Height = 21
        DataField = 'NOMBRE_CORREO'
        DataSource = DMUsuarioCuenta.DSQMUsuario
        TabOrder = 2
      end
      object DBEDirCorreo: TLFDbedit
        Left = 93
        Top = 115
        Width = 277
        Height = 21
        DataField = 'DIR_CORREO'
        DataSource = DMUsuarioCuenta.DSQMUsuario
        TabOrder = 3
      end
      object DBEDiasCaducidad: TLFDbedit
        Left = 93
        Top = 137
        Width = 43
        Height = 21
        Color = clInfoBk
        DataField = 'DIAS_CADUCIDAD'
        DataSource = DMUsuarioCuenta.DSQMUsuario
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBENombre: TLFDbedit
        Left = 93
        Top = 27
        Width = 277
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clInfoBk
        DataField = 'NOMBRE'
        DataSource = DMUsuarioCuenta.DSQMUsuario
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBDTPFechaCambioPassw: TLFDBDateEdit
        Left = 284
        Top = 137
        Width = 87
        Height = 21
        DataField = 'FECHA_CAMBIO_PASSW'
        DataSource = DMUsuarioCuenta.DSQMUsuario
        CheckOnExit = True
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 6
      end
      object EDTClaveCofirm: TLFEdit
        Left = 93
        Top = 71
        Width = 277
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
      end
    end
  end
  object CEMain: TControlEdit
    PanelEdicion = PNUsuario
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 240
    Top = 32
  end
  object CEMainPMEdit: TPopUpTeclas
    Left = 272
    Top = 32
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
