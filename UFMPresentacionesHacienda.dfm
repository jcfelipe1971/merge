inherited FMPresentacionesHacienda: TFMPresentacionesHacienda
  Left = 378
  Top = 258
  Width = 543
  Height = 420
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Presentaciones de Hacienda'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 533
    Height = 265
    inherited TBMain: TLFToolBar
      Width = 529
      inherited NavMain: THYMNavigator
        DataSource = DMPresentacionesHacienda.DSQMPresentacionesHacienda
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBENotas
        InsertaControl = DBEEjercicio
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      Top = 78
      Width = 529
      Height = 185
      TabOrder = 2
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 521
          Height = 157
          inherited G2KTableLoc: TG2KTBLoc
            Top = 80
            Tabla_a_buscar = 'VER_EMP_PRESENTACIONES_HACIENDA'
            CampoNum = 'MODELO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'MODELO'
              'EJERCICIO'
              'PERIODO')
          end
          object LEjercicio: TLFLabel
            Left = 19
            Top = 13
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
          end
          object LModelo: TLFLabel
            Left = 24
            Top = 35
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modelo'
          end
          object LPeriodo: TLFLabel
            Left = 21
            Top = 57
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Per'#237'odo'
          end
          object LNotas: TLFLabel
            Left = 31
            Top = 79
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object DBEEjercicio: TLFDbedit
            Left = 64
            Top = 9
            Width = 60
            Height = 21
            DataField = 'EJERCICIO'
            DataSource = DMPresentacionesHacienda.DSQMPresentacionesHacienda
            TabOrder = 0
          end
          object DBEFModelo: TLFDBEditFind2000
            Left = 64
            Top = 31
            Width = 120
            Height = 21
            CharCase = ecUpperCase
            DataField = 'MODELO'
            DataSource = DMPresentacionesHacienda.DSQMPresentacionesHacienda
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MODELOS_HACIENDA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'MODELO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'MODELO')
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitulo: TLFDbedit
            Left = 185
            Top = 31
            Width = 319
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPresentacionesHacienda.DSQMPresentacionesHacienda
            ReadOnly = True
            TabOrder = 2
          end
          object DBENotas: TDBMemo
            Left = 64
            Top = 75
            Width = 443
            Height = 80
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'NOTAS'
            DataSource = DMPresentacionesHacienda.DSQMPresentacionesHacienda
            ScrollBars = ssVertical
            TabOrder = 4
          end
          object DBCBPeriodo: TDBComboBox
            Left = 65
            Top = 53
            Width = 120
            Height = 21
            DataField = 'PERIODO'
            DataSource = DMPresentacionesHacienda.DSQMPresentacionesHacienda
            DropDownCount = 18
            ItemHeight = 13
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 521
          Height = 157
          DataSource = DMPresentacionesHacienda.DSQMPresentacionesHacienda
          CamposAOrdenar.Strings = (
            'EJERCICIO'
            'MODELO'
            'PERIODO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODELO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 270
              Visible = True
            end>
        end
      end
    end
    object PNLFiltro: TLFPanel
      Left = 2
      Top = 28
      Width = 529
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        529
        50)
      object LEjercicioFiltro: TLFLabel
        Left = 10
        Top = 19
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ejercicio'
      end
      object LPeriodoFiltro: TLFLabel
        Left = 134
        Top = 19
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo'
      end
      object LModeloFiltro: TLFLabel
        Left = 240
        Top = 19
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Modelo'
      end
      object CBEjercicio: TLFComboBox
        Left = 55
        Top = 15
        Width = 73
        Height = 21
        Style = csDropDownList
        DropDownCount = 18
        ItemHeight = 13
        TabOrder = 0
        OnChange = FiltroChange
      end
      object CBPeriodo: TLFComboBox
        Left = 177
        Top = 15
        Width = 56
        Height = 21
        Style = csDropDownList
        DropDownCount = 18
        ItemHeight = 13
        TabOrder = 1
        OnChange = FiltroChange
      end
      object EFModelo: TLFEditFind2000
        Left = 280
        Top = 15
        Width = 80
        Height = 21
        TabOrder = 2
        OnChange = EFModeloChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'MODELO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'SYS_MODELOS_HACIENDA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'MODELO')
        Filtros = [obPais]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETitModelo: TLFEdit
        Left = 361
        Top = 15
        Width = 155
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 265
    Width = 533
    Height = 102
    inherited TBDetalle: TLFToolBar
      Width = 533
      inherited NavDetalle: THYMNavigator
        DataSource = DMPresentacionesHacienda.DSQMAdjuntos
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 533
      Height = 80
      Color = clInfoBk
      DataSource = DMPresentacionesHacienda.DSQMAdjuntos
      OnDblClick = DBGFDetalleDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'TITULO_ADJUNTO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          ReadOnly = True
          Width = 200
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 367
    Width = 533
  end
  inherited CEMain: TControlEdit
    Left = 352
    Top = 2
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 382
    Top = 6
  end
  inherited ALMain: TLFActionList
    Left = 448
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 416
    Top = 8
  end
end
