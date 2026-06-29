object CrmFMVentas: TCrmFMVentas
  Left = 602
  Top = 193
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Marcajes Ventas'
  ClientHeight = 522
  ClientWidth = 819
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 819
    Height = 25
    DisabledImages = DMMain.ILMain_In
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavVentas: THYMNavigator
      Left = 0
      Top = 0
      Width = 147
      Height = 22
      DataSource = CrmDmVentas.DSQMCrmVentas
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbRefresh]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      EditaControl = DBGFCrmVentas
      InsertaControl = DBGFCrmVentas
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TSep2: TToolButton
      Left = 147
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object HYMEditPanel1: THYMEditPanel
      Left = 155
      Top = 0
      Width = 60
      Height = 22
      VisibleButtons = [neImprime, neRango, neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
      OnClickRango = HYMEditPanel1ClickRango
    end
  end
  object PnlMain: TLFPanel
    Left = 0
    Top = 25
    Width = 819
    Height = 497
    Align = alClient
    TabOrder = 1
    object PCDefecto: TLFPageControl
      Left = 1
      Top = 1
      Width = 817
      Height = 496
      ActivePage = TSFicha
      Align = alTop
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFicha: TTabSheet
        Caption = '&Ficha'
        object DBGFCrmVentas: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 809
          Height = 468
          Align = alClient
          DataSource = CrmDmVentas.DSQMCrmVentas
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 1
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
            'ID_ARTICULO'
            'ID_CONTACTO')
          CamposAMostrar.Strings = (
            'ID_ARTICULO'
            '1'
            'CODIGO'
            'ID_CONTACTO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            'ID_ARTICULO'
            '')
          CamposDesplegar.Strings = (
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ACTUALIZADO'
            'Compuesto'
            'CUARTAS'
            'FASE'
            'FECHA'
            'ID'
            'OP'
            'OPERARIO'
            'TIRADO')
          ColumnasCheckBoxes.Strings = (
            'ACTUALIZADO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ID_ARTICULO'
            'ID_CONTACTO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'CRM_ARTICULO'
            'CRM_CONTACTOS')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'DESCRIPCION'
            'NOMBRE_R_SOCIAL')
          Posicion = tpCentrado
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            ''
            ''
            '')
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_CONTACTO'
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DescContacto'
              ReadOnly = True
              Width = 176
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ARTICULO'
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DescArticulo'
              ReadOnly = True
              Width = 212
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Cantidad'
              ReadOnly = True
              Width = 92
              Visible = True
            end>
        end
      end
    end
  end
  object CEMain: TControlEdit
    DataSource = CrmDmVentas.DSQMCrmVentas
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 288
    Top = 64
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 328
    Top = 64
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
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
      Visible = False
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object FSMain: TLFFibFormStorage
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 520
    Top = 208
  end
end
