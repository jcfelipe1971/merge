inherited FMKitTallas: TFMKitTallas
  Left = 272
  Top = 170
  Caption = 'Kits de Tallas'
  ClientHeight = 317
  ClientWidth = 413
  OldCreateOrder = True
  PopupMenu = CETallasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 413
    Height = 293
    inherited TBMain: TLFToolBar
      Width = 409
      inherited NavMain: THYMNavigator
        DataSource = DSKit
        Hints.Strings = ()
        EditaControl = DBEKit
        InsertaControl = DBEKit
      end
      inherited EPMain: THYMEditPanel
        DataSource = DSKit
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TbuttComp: TToolButton
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 409
      Height = 117
      Align = alTop
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 401
          Height = 89
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'KIT'
              'TITULO')
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_KIT'
            CampoNum = 'KIT'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'KIT')
          end
          object LKit: TLFLabel
            Left = 32
            Top = 4
            Width = 12
            Height = 13
            Alignment = taRightJustify
            Caption = 'Kit'
          end
          object LTitulo: TLFLabel
            Left = 18
            Top = 26
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LGrupoTallas: TLFLabel
            Left = 15
            Top = 48
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo'
          end
          object DBEKit: TLFDbedit
            Left = 48
            Top = 0
            Width = 121
            Height = 21
            DataField = 'KIT'
            DataSource = DSKit
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 48
            Top = 22
            Width = 345
            Height = 21
            DataField = 'TITULO'
            DataSource = DSKit
            TabOrder = 1
          end
          object DBEFGrupoTallas: TLFDBEditFind2000
            Left = 48
            Top = 44
            Width = 64
            Height = 21
            DataField = 'ID_G_T'
            DataSource = DSKit
            TabOrder = 2
            OnChange = DBEFGrupoTallasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_GRUPOS_TALLAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'GRUPO'
            CampoStr = 'TITULO'
            CampoADevolver = 'ID_G_T'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object EGrupoTalla: TLFEdit
            Left = 112
            Top = 44
            Width = 64
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 3
            Text = 'EGrupoTalla'
          end
          object ETituloGrupo: TLFEdit
            Left = 178
            Top = 44
            Width = 215
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 4
            Text = 'ETituloGrupo'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 401
          Height = 89
          DataSource = DSKit
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'KIT'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'KIT'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 229
              Visible = True
            end>
        end
      end
    end
    object pnlDetalle: TLFPanel
      Left = 2
      Top = 145
      Width = 409
      Height = 146
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGTallas: TDBGridFind2000
        Left = 0
        Top = 27
        Width = 409
        Height = 119
        Align = alClient
        DataSource = DSKitTallas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        AutoCambiarColumna = False
        AutoPostEnCheckBox = False
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 0
        IndiceBitmapChecked = -1
        IndiceBitmapDescendente = 0
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TALLA'
            ReadOnly = True
            Width = 52
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO'
            ReadOnly = True
            Width = 221
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES'
            Visible = True
          end>
      end
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 409
        Height = 27
        EdgeInner = esNone
        EdgeOuter = esNone
        TabOrder = 1
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 2
          Width = 192
          Height = 22
          DataSource = DSKitTallas
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
          Flat = True
          ParentShowHint = False
          PopupMenu = CETallasPMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGTallas
          InsertaControl = DBGTallas
          Exclusivo = True
          ControlEdit = CETallas
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 293
    Width = 413
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    DataSource = DSKit
    EnlazadoA = CETallas
    Complementario = pnlDetalle
    Top = 124
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 296
    Top = 64
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 254
    Top = 42
  end
  object DSKit: TDataSource
    DataSet = DMMaestrosTallas.QMArtKit
    Left = 192
    Top = 88
  end
  object DSKitTallas: TDataSource
    DataSet = DMMaestrosTallas.QMArtKitTallas
    Left = 192
    Top = 208
  end
  object CETallas: TControlEdit
    DataSource = DSKitTallas
    EnlazadoA = CEMain
    Complementario = PCMain
    PopUpMenu = CETallasPMEdit
    Teclas = DMMain.Teclas
    Left = 256
    Top = 200
  end
  object CETallasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 288
    Top = 168
    object CETallasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CETallasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CETallasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CETallasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CETallasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CETallasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CETallasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CETallasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CETallasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CETallasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
