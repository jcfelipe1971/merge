inherited FMImprimeCartaPortes: TFMImprimeCartaPortes
  Width = 866
  Height = 574
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Imprime Carta de Portes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 856
    Height = 521
    inherited TBMain: TLFToolBar
      Width = 852
      object NavImp: THYMNavigator [0]
        Left = 0
        Top = 0
        Width = 110
        Height = 22
        DataSource = DMImprimeCartaPortes.DSQMAlbaranes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 1
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object ToolButton1: TToolButton [1]
        Left = 110
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TbuttMarcar: TToolButton [2]
        Left = 118
        Top = 0
        Hint = 'Marcar todos los Albaranes'
        Caption = 'Marcar'
        ImageIndex = 146
        OnClick = TbuttMarcarClick
      end
      object TButtCancelar: TToolButton [3]
        Left = 141
        Top = 0
        Hint = 'Desmarcar todos los Albaranes'
        Caption = 'Desmarcar'
        ImageIndex = 147
        OnClick = TButtCancelarClick
      end
      object Butt1: TToolButton [4]
        Left = 164
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtGenerar: TToolButton [5]
        Left = 172
        Top = 0
        Hint = 'Generar e imprimir carta de porte'
        Caption = 'Generar'
        ImageIndex = 112
        OnClick = TButtGenerarClick
      end
      object Butt2: TToolButton [6]
        Left = 195
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 203
        Hints.Strings = ()
      end
      object PNLTodosLosAlbaranes: TLFPanel
        Left = 283
        Top = 0
        Width = 182
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        TabOrder = 2
        object CBTodosLosAlbaranes: TLFCheckBox
          Left = 8
          Top = 3
          Width = 169
          Height = 17
          Caption = 'Muestra Todos los Albaranes'
          ClicksDisabled = False
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBTodosLosAlbaranesChange
        end
      end
    end
    object PNLDatosCartaPorte: TLFPanel
      Left = 2
      Top = 28
      Width = 852
      Height = 109
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LFecha: TLFLabel
        Left = 54
        Top = 17
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
      end
      object LTransportista: TLFLabel
        Left = 23
        Top = 39
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Transportista'
      end
      object LDirTransportista: TLFLabel
        Left = 4
        Top = 60
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dir. Transportista'
      end
      object LMatriculaDefecto: TLFLabel
        Left = 478
        Top = 39
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Matricula'
      end
      object LNaturaleza: TLFLabel
        Left = 470
        Top = 60
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Naturaleza'
      end
      object EFTransportista: TLFEditFind2000
        Left = 88
        Top = 35
        Width = 97
        Height = 21
        TabOrder = 1
        OnChange = EFTransportistaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TRANSPORTISTA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_TRANSPORTISTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TRANSPORTISTA')
        Filtros = []
      end
      object EFDirTransportista: TLFEditFind2000
        Left = 88
        Top = 57
        Width = 97
        Height = 21
        TabOrder = 2
        OnChange = EFDirTransportistaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'DIRECCION'
        CampoStr = 'DIR_COMPLETA_N'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFDirTransportistaBusqueda
        OrdenadoPor.Strings = (
          'DIRECCION')
        Filtros = []
      end
      object ETransportista: TLFEdit
        Left = 186
        Top = 35
        Width = 276
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 3
      end
      object EDirTransportista: TLFEdit
        Left = 186
        Top = 57
        Width = 276
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 4
      end
      object DEFecha: TLFDateEdit
        Left = 88
        Top = 13
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object EFMatricula: TLFEditFind2000
        Left = 526
        Top = 35
        Width = 121
        Height = 21
        TabOrder = 5
        OnChange = EFMatriculaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'MATRICULA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_MATRICULAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'DEFECTO DESC, MATRICULA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFNaturaleza: TLFEditFind2000
        Left = 526
        Top = 57
        Width = 121
        Height = 21
        TabOrder = 6
        OnChange = EFNaturalezaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'NATURALEZA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_NATURALEZA_CARGA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'DEFECTO DESC, NATURALEZA')
        Filtros = []
      end
      object ETituloMatricula: TLFEdit
        Left = 648
        Top = 35
        Width = 193
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 7
      end
      object ETituloNaturaleza: TLFEdit
        Left = 648
        Top = 57
        Width = 193
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 8
      end
    end
    object DBGAlbaranes: THYTDBGrid
      Left = 2
      Top = 137
      Width = 852
      Height = 382
      Align = alClient
      Color = clInfoBk
      DataSource = DMImprimeCartaPortes.DSQMAlbaranes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      ControlEdit = CEMain
      PermutaPaneles = False
      CamposAMarcar.Strings = (
        'CARTA_PORTE')
      CamposChecked.Strings = (
        '1')
      CamposNoChecked.Strings = (
        '0')
      CamposAOrdenar.Strings = (
        'CANAL'
        'CLIENTE'
        'FECHA'
        'FORMA_PAGO'
        'MONEDA'
        'RIG'
        'SERIE'
        'SU_REFERENCIA'
        'TITULO'
        'TOTAL_A_COBRAR')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 238
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SU_REFERENCIA'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORMA_PAGO'
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_A_COBRAR'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONEDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CARTA_PORTE'
          Width = 58
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 521
    Width = 856
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
  end
end
