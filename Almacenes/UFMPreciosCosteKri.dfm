inherited FMPreciosCosteKri: TFMPreciosCosteKri
  Left = 256
  Top = 183
  Width = 697
  Height = 540
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Precios de Coste'
  OldCreateOrder = False
  PopupMenu = PopupPreciosCoste
  PixelsPerInch = 96
  TextHeight = 13
  object G2KTableLoc: TG2KTBLoc [0]
    Left = 32
    Top = 72
    Hint = 'Localizar'
    Caption = 'G2KTableLoc'
    ImageIndex = 81
    DataSource = DMPreciosCosteKri.DSQMPreciosCoste
    Base_de_datos = DMMain.DataBase
    Tabla_a_buscar = 'ART_PRECIOS_COSTE_KRI'
    CampoNum = 'ARTICULO'
    CampoStr = 'TITULO'
    Filtros = [obEmpresa, obEjercicio, obCanal]
    Entorno = DMMain.EntornoBusqueda
    OrdenadoPor.Strings = (
      'ARTICULO')
  end
  inherited PMain: TLFPanel
    Width = 687
    Height = 487
    inherited TBMain: TLFToolBar
      Width = 683
      Height = 27
      ButtonHeight = 23
      inherited NavMain: THYMNavigator
        Width = 190
        Height = 23
        DataSource = DMPreciosCosteKri.DSQMPreciosCoste
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        PopupMenu = PopupPreciosCoste
        ControlEdit = CEPreciosCoste
      end
      inherited TSepNav: TToolButton
        Left = 190
      end
      inherited EPMain: THYMEditPanel
        Left = 198
        Width = 78
        Height = 23
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        PopupMenu = PopupPreciosCoste
        ControlEdit = CEPreciosCoste
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 276
      end
      inherited TbuttComp: TToolButton
        Left = 284
      end
      object TBSep1: TToolButton
        Left = 307
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLAlmacen: TLFPanel
        Left = 315
        Top = 0
        Width = 337
        Height = 23
        BevelOuter = bvNone
        TabOrder = 2
        object LAlmacen: TLFLabel
          Left = 18
          Top = 4
          Width = 61
          Height = 16
          Alignment = taRightJustify
          Caption = 'Almac'#233'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object LFEFAlmacen: TLFEditFind2000
          Left = 81
          Top = 2
          Width = 56
          Height = 21
          TabOrder = 0
          OnChange = LFEFAlmacenChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EAlmacen: TLFEdit
          Left = 138
          Top = 2
          Width = 197
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
        end
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 29
      Width = 683
      Height = 456
      Align = alClient
      DataSource = DMPreciosCosteKri.DSQMPreciosCoste
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'FAMILIA'
        'TITULO'
        'PCOSTE_KRI')
      CamposNoAccesibles.Strings = (
        'ARTICULO'
        'FAMILIA'
        'TITULO')
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
          FieldName = 'ARTICULO'
          ReadOnly = True
          Width = 120
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 359
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FAMILIA'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PCOSTE'
          Width = 94
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 487
    Width = 687
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMifirst: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiprior: TMenuItem
      OnClick = nil
    end
    inherited CEMainMinext: TMenuItem
      OnClick = nil
    end
    inherited CEMainMilast: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiinsert: TMenuItem
      OnClick = nil
    end
    inherited CEMainMidelete: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiedit: TMenuItem
      OnClick = nil
    end
    inherited CEMainMipost: TMenuItem
      OnClick = nil
    end
    inherited CEMainMicancel: TMenuItem
      OnClick = nil
    end
    inherited CEMainMirefresh: TMenuItem
      OnClick = nil
    end
    inherited CEMainMibuscar: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiaprox: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiexacta: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiimprime: TMenuItem
      OnClick = nil
    end
    inherited CEMainMirango: TMenuItem
      OnClick = nil
    end
    inherited CEMainMireport: TMenuItem
      OnClick = nil
    end
    inherited CEMainMicopy: TMenuItem
      OnClick = nil
    end
    inherited CEMainMicut: TMenuItem
      OnClick = nil
    end
    inherited CEMainMipaste: TMenuItem
      OnClick = nil
    end
    inherited CEMainMisalir: TMenuItem
      OnClick = nil
    end
  end
  object CEPreciosCoste: TControlEdit
    PopUpMenu = PopupPreciosCoste
    Teclas = DMMain.Teclas
    Left = 272
    Top = 116
  end
  object PopupPreciosCoste: TPopUpTeclas
    Left = 332
    Top = 116
    object CETarifasPArticuloMifirst: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object CETarifasPArticuloMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CETarifasPArticuloMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CETarifasPArticuloMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CETarifasPArticuloMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CETarifasPArticuloMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CETarifasPArticuloMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
      Visible = False
    end
    object CETarifasPArticuloMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
      Visible = False
    end
    object CETarifasPArticuloMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
      Visible = False
    end
    object CETarifasPArticuloMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
    object CEPreciosCosteMiSep: TMenuItem
      Caption = '-'
      ShortCut = 16499
    end
    object CEPreciosCosteMibuscar: TMenuItem
      Caption = 'Buscar'
      Enabled = False
    end
    object CEPreciosCosteMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
    end
    object CEPreciosCosteMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
    end
    object CEPreciosCosteMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
    end
    object CEPreciosCosteMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      Visible = False
    end
    object CEPreciosCosteMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      Visible = False
    end
    object CEPreciosCosteMicopy: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      Visible = False
    end
    object CEPreciosCosteMicut: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      Visible = False
    end
    object CEPreciosCosteMipaste: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      Visible = False
    end
    object CEPreciosCosteMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
    end
  end
end
