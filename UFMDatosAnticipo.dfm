object FMDatosAnticipo: TFMDatosAnticipo
  Left = 330
  Top = 298
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Datos de Anticipo'
  ClientHeight = 116
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 514
    Height = 24
    AutoSize = True
    EdgeBorders = [ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 40
      Height = 22
      VisibleButtons = [nbPost, nbCancel]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      OnClickBefore = NavMainClickBefore
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
  end
  object PNLDatosAnticipo: TLFPanel
    Left = 0
    Top = 24
    Width = 514
    Height = 92
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    object LBLFecha: TLFLabel
      Left = 40
      Top = 25
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object LBLCtaPago: TLFLabel
      Left = 11
      Top = 47
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cta de Pago'
    end
    object DBDFecha: TLFDBDateEdit
      Left = 75
      Top = 21
      Width = 90
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 0
    end
    object DBEFCta: TLFDBEditFind2000
      Left = 75
      Top = 43
      Width = 90
      Height = 21
      TabOrder = 1
      OnChange = DBEFCtaChange
      OnExit = DBEFCtaExit
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'tipo=5'
      ReemplazarCaracter = True
      SalirSiNoExiste = True
      SalirSiVacio = False
      OrdenadoPor.Strings = (
        'CUENTA')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object HYDBDTituloCuenta: TLFHYDBDescription
      Left = 166
      Top = 43
      Width = 336
      Height = 21
      Color = clInfoBk
      DataSource = DMFacturas.DSQMDetalle
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Tabla_a_buscar = 'CON_CUENTAS'
      Campo_Descripcion = 'TITULO'
      Base_de_datos = DMMain.DataBase
      CamposWhereOrigen.Strings = (
        'CANAL'
        'CTA_PAGO_ANTICIPO'
        'EJERCICIO'
        'EMPRESA')
      CamposWhereTabla.Strings = (
        'CANAL'
        'CUENTA'
        'EJERCICIO'
        'EMPRESA')
    end
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 108
    Top = 16
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 140
    Top = 16
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
