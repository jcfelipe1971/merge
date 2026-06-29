inherited FMIntrastat: TFMIntrastat
  Left = 248
  Top = 214
  Width = 1261
  Height = 600
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Intrastat'
  PopupMenu = CENotasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1251
    Height = 160
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 1247
      inherited NavMain: THYMNavigator
        Width = 160
        DataSource = DMIntrastat.DSQMIntrastat
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBEPeriodo
      end
      inherited TSepNav: TToolButton
        Left = 160
      end
      inherited EPMain: THYMEditPanel
        Left = 168
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 191
      end
      inherited TbuttComp: TToolButton
        Left = 199
      end
      object TButtSep2: TToolButton
        Left = 222
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBRefrescarIntrastat: TToolButton
        Left = 230
        Top = 0
        Action = ARefrescarIntrastat
      end
      object TButtSep3: TToolButton
        Left = 253
        Top = 0
        Width = 8
        ImageIndex = 27
        Style = tbsSeparator
      end
      object TBRecalcularIntrastat: TToolButton
        Left = 261
        Top = 0
        Action = ARecalcularIntrastat
      end
      object TButtSep4: TToolButton
        Left = 284
        Top = 0
        Width = 8
        ImageIndex = 95
        Style = tbsSeparator
      end
      object TBGeneraFichero: TToolButton
        Left = 292
        Top = 0
        Action = AGeneraFichero
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1247
      Height = 130
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 1239
          Height = 102
          inherited G2KTableLoc: TG2KTBLoc
            Top = 42
            Enabled = False
          end
          object LblPeriodo: TLFLabel
            Left = 27
            Top = 26
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Periodo'
          end
          object LTipo: TLFLabel
            Left = 42
            Top = 4
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object DBEPeriodo: TLFDbedit
            Left = 68
            Top = 22
            Width = 42
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'PERIODO'
            DataSource = DMIntrastat.DSQMIntrastat
            Enabled = False
            TabOrder = 2
          end
          object DBRGRealMod: TDBRadioGroup
            Left = 68
            Top = 66
            Width = 333
            Height = 33
            Columns = 2
            DataField = 'REAL_MOD'
            DataSource = DMIntrastat.DSQMIntrastat
            Enabled = False
            Items.Strings = (
              'Real'
              'Modificado')
            TabOrder = 6
            Values.Strings = (
              '0'
              '1')
          end
          object DBETituloPeriodo: TLFDbedit
            Left = 111
            Top = 22
            Width = 290
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMIntrastat.DSxPeriodos
            Enabled = False
            TabOrder = 3
          end
          object DBEPeriodoDesde: TLFDbedit
            Left = 111
            Top = 44
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'DESDE'
            DataSource = DMIntrastat.DSxPeriodos
            Enabled = False
            TabOrder = 4
          end
          object DBEPeriodoHasta: TLFDbedit
            Left = 271
            Top = 44
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'HASTA'
            DataSource = DMIntrastat.DSxPeriodos
            Enabled = False
            TabOrder = 5
          end
          object DBETipo: TLFDbedit
            Left = 68
            Top = 0
            Width = 42
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMIntrastat.DSQMIntrastat
            Enabled = False
            TabOrder = 0
            OnChange = DBETipoChange
          end
          object ETituloTipo: TLFEdit
            Left = 111
            Top = 0
            Width = 290
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 1
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1239
          Height = 23
          ButtonWidth = 22
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object PNL_I_Info: TLFPanel
            Left = 0
            Top = 0
            Width = 330
            Height = 22
            Align = alLeft
            Enabled = False
            TabOrder = 0
            object DBE_I_cod: TLFDbedit
              Left = 1
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'PERIODO'
              DataSource = DMIntrastat.DSQMIntrastat
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
            object DBE_I_Nom: TLFDbedit
              Left = 68
              Top = 1
              Width = 260
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMIntrastat.DSxPeriodos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object TButtSep: TToolButton
            Left = 330
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 338
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMIntrastat.DSQMIntrastat
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMMNotas
            Exclusivo = False
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLEditNotas: TLFPanel
          Left = 0
          Top = 23
          Width = 1239
          Height = 79
          Align = alClient
          Enabled = False
          TabOrder = 1
          object DBMMNotas: TLFDBMemo
            Left = 1
            Top = 1
            Width = 1237
            Height = 77
            Align = alClient
            DataField = 'COMENTARIOS'
            DataSource = DMIntrastat.DSQMIntrastat
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1239
          Height = 102
          DataSource = DMIntrastat.DSQMIntrastat
          Columns = <
            item
              Expanded = False
              FieldName = 'PERIODO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REAL_MOD'
              Width = 80
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 547
    Width = 1251
  end
  object PCDetalle: TLFPageControl [2]
    Left = 0
    Top = 160
    Width = 1251
    Height = 387
    ActivePage = TSDeclaracion
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 2
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSDeclaracion: TTabSheet
      Caption = 'Declaracion'
      object PDetalle: TLFPanel
        Left = 0
        Top = 0
        Width = 1243
        Height = 359
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object TBDeclaracion: TLFToolBar
          Left = 0
          Top = 0
          Width = 1243
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object NavDeclaracion: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMIntrastat.DSQMDetalle
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFDeclaracion
            InsertaControl = DBGFDeclaracion
            Exclusivo = False
            ControlEdit = CEDetalle
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFDeclaracion: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1243
          Height = 337
          Align = alClient
          DataSource = DMIntrastat.DSQMDetalle
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFDeclaracionCellClick
          OnDrawColumnCell = DBGFDeclaracionDrawColumnCell
          Insercion = False
          ColumnaInicial = 1
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
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
            'COND_ENTREGA'
            'MODALIDAD_TRANSPORTE')
          CamposAMostrar.Strings = (
            'COND_ENTREGA'
            '0'
            'MODALIDAD_TRANSPORTE'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'CODIGO_MERCANCIA'
            'COND_ENTREGA'
            'ESTADO_MIEMBRO'
            'IVA_VIES'
            'LINEA'
            'MASA_NETA'
            'MODALIDAD_TRANSPORTE'
            'NATURALEZA_TRANSACCION'
            'PAIS_ORIGEN'
            'PERIODO'
            'PROVINCIA_ORI_DES'
            'PUERTO_CARGA_DESCARGA'
            'REGIMEN_ESTADISTICO'
            'UNIDADES_SUPLEMENTARIAS'
            'VALOR'
            'VALOR_ESTADISTICO'
            'I_PORTE_PROPORCIONAL')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODIGO'
            'TIPO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_CODIGO_INCOTERM'
            'SYS_TIPOS_TRANSPORTE')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            'TIPO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              ReadOnly = True
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_MIEMBRO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVINCIA_ORI_DES'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COND_ENTREGA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NATURALEZA_TRANSACCION'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODALIDAD_TRANSPORTE'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUERTO_CARGA_DESCARGA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_MERCANCIA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS_ORIGEN'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REGIMEN_ESTADISTICO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MASA_NETA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES_SUPLEMENTARIAS'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_ESTADISTICO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA_VIES'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'I_PORTE_PROPORCIONAL'
              Width = 80
              Visible = True
            end>
        end
      end
    end
    object TSDetalle: TTabSheet
      Caption = 'Detalle'
      ImageIndex = 1
      object PNLDetalle: TLFPanel
        Left = 0
        Top = 0
        Width = 1243
        Height = 359
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 1243
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object NavDetalle: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMIntrastat.DSDocumentos
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFDetalle
            InsertaControl = DBGFDetalle
            Exclusivo = False
            ControlEdit = CEDetalle
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1243
          Height = 337
          Align = alClient
          DataSource = DMIntrastat.DSDocumentos
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFDetalleCellClick
          OnDrawColumnCell = DBGFDetalleDrawColumnCell
          OnDblClick = DBGFDetalleDblClick
          Insercion = False
          ColumnaInicial = 1
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
          Campos.Strings = (
            'COND_ENTREGA'
            'ARTICULO'
            'MODALIDAD_TRANSPORTE'
            'PAIS_ORIGEN')
          CamposAMostrar.Strings = (
            'COND_ENTREGA'
            '0'
            'ARTICULO'
            '0'
            'MODALIDAD_TRANSPORTE'
            '0'
            'PAIS_ORIGEN'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'CODIGO_MERCANCIA'
            'COND_ENTREGA'
            'ESTADO_MIEMBRO'
            'IVA_VIES'
            'LINEA'
            'MASA_NETA'
            'MODALIDAD_TRANSPORTE'
            'NATURALEZA_TRANSACCION'
            'PAIS_ORIGEN'
            'PROVINCIA_ORI_DES'
            'PUERTO_CARGA_DESCARGA'
            'REGIMEN_ESTADISTICO'
            'RIG'
            'SERIE'
            'UNIDADES_SUPLEMENTARIAS'
            'VALOR'
            'VALOR_ESTADISTICO'
            'ARTICULO'
            'I_PORTE_PROPORCIONAL'
            'IGNORAR')
          ColumnasCheckBoxes.Strings = (
            'IGNORAR')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODIGO'
            'ARTICULO'
            'TIPO'
            'PAIS_C2')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_CODIGO_INCOTERM'
            'VER_ARTICULOS_EF'
            'SYS_TIPOS_TRANSPORTE'
            'SYS_PAISES')
          Acciones.Strings = (
            ''
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFDetalleBusqueda
          Planes.Strings = (
            ''
            ''
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            'CODIGO'
            'TIPO'
            'PAIS_C2')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG'
              ReadOnly = True
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              ReadOnly = True
              Width = 35
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_MIEMBRO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVINCIA_ORI_DES'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COND_ENTREGA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NATURALEZA_TRANSACCION'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODALIDAD_TRANSPORTE'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUERTO_CARGA_DESCARGA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_MERCANCIA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS_ORIGEN'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REGIMEN_ESTADISTICO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MASA_NETA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES_SUPLEMENTARIAS'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_ESTADISTICO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA_VIES'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'I_PORTE_PROPORCIONAL'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IGNORAR'
              Width = 37
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Left = 372
    Top = 10
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 424
    Top = 12
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
    Left = 336
    Top = 8
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ARefrescarIntrastat: TAction
      Category = 'Procesos'
      Caption = 'Refrescar'
      Hint = 'Refresca los datos del Intrastat'
      ImageIndex = 26
      OnExecute = ARefrescarIntrastatExecute
    end
    object ARecalcularIntrastat: TAction
      Category = 'Procesos'
      Caption = 'Recalcular Intrastat'
      Hint = 'Borra los datos y vuelve a calcular los datos para intrastat'
      ImageIndex = 94
      OnExecute = ARecalcularIntrastatExecute
    end
    object AGeneraFichero: TAction
      Category = 'Procesos'
      Caption = 'Genera Fichero'
      Hint = 'Genera fichero de delcaracion'
      ImageIndex = 49
      OnExecute = AGeneraFicheroExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 336
    Top = 40
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    Complementario = PMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 374
    Top = 118
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 426
    Top = 120
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CENotas: TControlEdit
    EnlazadoA = CEDetalle
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLEditNotas
    Complementario = TBMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 374
    Top = 44
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 426
    Top = 46
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
