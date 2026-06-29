inherited FMIncidenciasMarcajes: TFMIncidenciasMarcajes
  Left = 487
  Top = 207
  Width = 982
  Height = 698
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Incidencias Marcajes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 972
    Height = 645
    inherited TBMain: TLFToolBar
      Width = 968
      inherited NavMain: THYMNavigator
        Width = 120
        DataSource = ProDMMarcajesMaq.DSQMProCabMarcaI
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 120
      end
      inherited EPMain: THYMEditPanel
        Left = 128
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 161
      end
      inherited TbuttComp: TToolButton
        Left = 169
      end
    end
    object PNLFiltros: TPanel
      Left = 2
      Top = 28
      Width = 968
      Height = 23
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LFamilia: TLFLabel
        Left = 3
        Top = 4
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'M'#225'quina'
      end
      object LFechas: TLFLabel
        Left = 324
        Top = 4
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Rango Fechas:'
      end
      object LTipoIncidencia: TLFLabel
        Left = 609
        Top = 4
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Incidencia'
        Layout = tlCenter
      end
      object CBArticulosBaja: TLFCheckBox
        Left = 1126
        Top = 3
        Width = 50
        Height = 17
        Caption = 'Baja'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
      end
      object EFMaquina: TLFEditFind2000
        Left = 48
        Top = 0
        Width = 55
        Height = 21
        TabOrder = 1
        OnChange = EFMaquinaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CODMAQ'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'PRO_MAQUINAS_C'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CODMAQ')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EMaquina: TLFEdit
        Left = 104
        Top = 0
        Width = 214
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DEFechaDesde: TLFDateEdit
        Left = 401
        Top = 0
        Width = 100
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 3
        OnChange = DEFechaDesdeChange
      end
      object DEFechaHasta: TLFDateEdit
        Left = 502
        Top = 0
        Width = 100
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
        OnChange = DEFechaHastaChange
      end
      object EFTipoIncidencia: TLFEditFind2000
        Left = 685
        Top = 0
        Width = 45
        Height = 21
        TabOrder = 5
        OnChange = EFTipoIncidenciaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TIPO'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TIPO_INCIDENCIAS_MAQ'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = []
      end
      object ETipoIncidenciaTitulo: TLFEdit
        Left = 731
        Top = 0
        Width = 183
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object DBGMarca: TDBGridFind2000
      Left = 2
      Top = 51
      Width = 968
      Height = 592
      Align = alClient
      Color = clInfoBk
      DataSource = ProDMMarcajesMaq.DSQMProCabMarcaI
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
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
        'TITULO_ARTICULO'
        'CALCULO'
        'UNID_MINIMAS'
        'UNID_MAXIMAS'
        'PRECIO_BASE'
        'COMISION'
        'PRECIO_VENTA'
        'BLOQUEADO'
        'BARRAS'
        'SUBFAMILIA'
        'FAMILIA')
      CamposNoAccesibles.Strings = (
        'BARRAS'
        'FAMILIA'
        'SUBFAMILIA'
        'TITULO_ARTICULO'
        'CALCULO'
        'UNID_MINIMAS'
        'UNID_MAXIMAS'
        'PRECIO_BASE_CANAL'
        'COMISION_CANAL'
        'MARGEN_PC'
        'MARGEN_PV'
        '')
      ColumnasCheckBoxes.Strings = (
        'BLOQUEADO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CODMAQ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION_MAQUINA'
          Width = 268
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_DET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_INCIDENCIA'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION_TIPO'
          Width = 251
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_INICIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_FIN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIEMPO'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 645
    Width = 972
  end
  inherited CEMain: TControlEdit
    Left = 288
    Top = 116
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 324
    Top = 116
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
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 360
    Top = 118
  end
  inherited FSMain: TLFFibFormStorage
    Left = 396
    Top = 119
  end
end
