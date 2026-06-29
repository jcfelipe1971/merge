object FMDigitosCoste: TFMDigitosCoste
  Left = 657
  Top = 380
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'C. Costes'
  ClientHeight = 169
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEDigitosCostePMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNMain: TLFPanel
    Left = 0
    Top = 0
    Width = 264
    Height = 169
    Align = alClient
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 1
      Top = 1
      Width = 262
      Height = 24
      AutoSize = True
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Separators = True
      object NavDigitosCoste: THYMNavigator
        Left = 0
        Top = 0
        Width = 192
        Height = 22
        DataSource = DMDigitosCoste.DSQMCentroCoste
        VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        ParentShowHint = False
        PopupMenu = CEDigitosCostePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEDigitosCoste
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object TButtConfirmar: TToolButton
        Left = 192
        Top = 0
        Hint = 'Confirmar Centro de Costes'
        ImageIndex = 19
        OnClick = TButtConfirmarClick
      end
    end
    object DBGCentroCoste: TDBGridFind2000
      Left = 1
      Top = 25
      Width = 262
      Height = 143
      Align = alClient
      DataSource = DMDigitosCoste.DSQMCentroCoste
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
        'D1'
        'D2'
        'D3'
        'D4'
        'D5')
      CamposAMostrar.Strings = (
        'D1'
        '0'
        'D2'
        '0'
        'D3'
        '0'
        'D4'
        '0'
        'D5'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        ''
        ''
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1'
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      MensajeNoExiste = False
      Numericos.Strings = (
        'LET_DIGITO'
        'LET_DIGITO'
        'LET_DIGITO'
        'LET_DIGITO'
        'LET_DIGITO')
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tablas.Strings = (
        'CON_CENTROS_COSTE'
        'CON_CENTROS_COSTE'
        'CON_CENTROS_COSTE'
        'CON_CENTROS_COSTE'
        'CON_CENTROS_COSTE')
      Acciones.Strings = (
        ''
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO')
      Posicion = tpCentrado
      OnBusqueda = DBGCentroCosteBusqueda
      Planes.Strings = (
        ''
        ''
        ''
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'LET_DIGITO'
        'LET_DIGITO'
        'LET_DIGITO'
        'LET_DIGITO'
        'LET_DIGITO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'D1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D3'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D4'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D5'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAJE'
          Width = 60
          Visible = True
        end>
    end
  end
  object CEDigitosCoste: TControlEdit
    DataSource = DMDigitosCoste.DSQMCentroCoste
    PopUpMenu = CEDigitosCostePMEdit
    Teclas = DMMain.Teclas
    Left = 144
    Top = 120
  end
  object CEDigitosCostePMEdit: TPopUpTeclas
    Left = 176
    Top = 120
    object CEDigitosCosteMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEDigitosCosteMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDigitosCosteMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDigitosCosteMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEDigitosCosteMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDigitosCosteMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDigitosCosteMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDigitosCosteMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDigitosCosteMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDigitosCosteMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 208
    Top = 120
  end
end
