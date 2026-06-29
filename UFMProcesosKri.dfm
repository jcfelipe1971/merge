inherited FMProcesosKri: TFMProcesosKri
  Left = 481
  Top = 248
  Caption = 'Procesos'
  ClientHeight = 372
  PopupMenu = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 348
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMProcesosKri.DSQMProcesosCabecera
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMProcesosKri.DSQMProcesosCabecera
        Hints.Strings = ()
      end
    end
    inherited PCMain: TLFPageControl
      Height = 85
      OnChange = PCMainChange
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 57
          object PNLEdit: TLFPanel
            Left = 0
            Top = 0
            Width = 490
            Height = 57
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LProceso: TLFLabel
              Left = 7
              Top = 9
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'Proceso'
            end
            object LTitulo: TLFLabel
              Left = 20
              Top = 31
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'Titulo'
            end
            object DBEID: TLFDbedit
              Left = 50
              Top = 5
              Width = 71
              Height = 21
              Color = clInfoBk
              DataField = 'ID'
              DataSource = DMProcesosKri.DSQMProcesosCabecera
              Enabled = False
              TabOrder = 0
            end
            object DBETitulo: TLFDbedit
              Left = 50
              Top = 27
              Width = 431
              Height = 21
              DataField = 'TITULO'
              DataSource = DMProcesosKri.DSQMProcesosCabecera
              TabOrder = 1
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 57
          DataSource = DMProcesosKri.DSQMProcesosCabecera
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 379
              Visible = True
            end>
        end
      end
    end
    object PNLDetalle: TLFPanel
      Left = 2
      Top = 113
      Width = 498
      Height = 233
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object LBLAviso: TLFLabel
        Left = 65
        Top = 36
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Aviso'
      end
      object LBLUsuario: TLFLabel
        Left = 55
        Top = 58
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Usuario'
      end
      object LBLTercero: TLFLabel
        Left = 54
        Top = 102
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tercero'
      end
      object LBLDirigido: TLFLabel
        Left = 47
        Top = 80
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dirigido a'
      end
      object LBLFechaActual: TLFLabel
        Left = 315
        Top = 36
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
      end
      object DBCKUrgente: TLFDBCheckBox
        Left = 97
        Top = 120
        Width = 65
        Height = 17
        Caption = 'Urgente'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Alignment = taLeftJustify
        DataField = 'URGENTE'
        DataSource = DMProcesosKri.DSQMProcesosDetalle
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEAviso: TLFDbedit
        Left = 97
        Top = 33
        Width = 74
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'AVISO'
        DataSource = DMProcesosKri.DSQMProcesosDetalle
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEFUsuarioFin: TLFDBEditFind2000
        Left = 97
        Top = 77
        Width = 74
        Height = 21
        DataField = 'USUARIO_FIN'
        DataSource = DMProcesosKri.DSQMProcesosDetalle
        TabOrder = 1
        OnChange = DBEFUsuarioFinChange
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'SYS_USUARIOS'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'USUARIO'
        CampoStr = 'NOMBRE'
        ReemplazarCaracter = True
        SalirSiNoExiste = False
        SalirSiVacio = False
        Filtros = []
      end
      object DBEFTercero: TLFDBEditFind2000
        Left = 97
        Top = 99
        Width = 74
        Height = 21
        DataField = 'TERCERO'
        DataSource = DMProcesosKri.DSQMProcesosDetalle
        TabOrder = 2
        OnChange = DBEFTerceroChange
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'SYS_TERCEROS'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'TERCERO'
        CampoStr = 'NOMBRE_R_SOCIAL'
        ReemplazarCaracter = True
        SalirSiNoExiste = False
        SalirSiVacio = False
        Filtros = [obEmpresa]
      end
      object DBMMensaje: TLFDBMemo
        Left = 172
        Top = 121
        Width = 266
        Height = 103
        DataField = 'MENSAJE'
        DataSource = DMProcesosKri.DSQMProcesosDetalle
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object DBDEFechaIni: TLFDBDateEdit
        Left = 351
        Top = 33
        Width = 87
        Height = 21
        TabStop = False
        DataField = 'FECHA_INI'
        DataSource = DMProcesosKri.DSQMProcesosDetalle
        ReadOnly = True
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
        TabOrder = 4
      end
      object DBEUsuario: TLFDbedit
        Left = 97
        Top = 55
        Width = 74
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'USUARIO'
        DataSource = DMProcesosKri.DSQMProcesosDetalle
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        OnChange = DBEUsuarioChange
      end
      object ETitUsuario: TLFEdit
        Left = 172
        Top = 55
        Width = 265
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object ETitUsuarioFin: TLFEdit
        Left = 172
        Top = 77
        Width = 265
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object ETitTercero: TLFEdit
        Left = 172
        Top = 99
        Width = 265
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 498
        Height = 29
        TabOrder = 10
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 2
          Width = 240
          Height = 22
          DataSource = DMProcesosKri.DSQMProcesosDetalle
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBEFUsuarioFin
          InsertaControl = DBEFUsuarioFin
          Exclusivo = True
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 348
  end
  inherited CEMain: TControlEdit
    DataSource = DMProcesosKri.DSQMProcesosCabecera
  end
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ALanzaAvisos: TAction
      Category = 'Procesos'
      Caption = 'Lanza Avisos'
      ImageIndex = 8
      OnExecute = ALanzaAvisosExecute
    end
  end
end
