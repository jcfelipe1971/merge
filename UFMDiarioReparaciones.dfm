inherited FMDiarioReparaciones: TFMDiarioReparaciones
  Left = 275
  Top = 213
  Width = 944
  Height = 516
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Diario de Reparaciones'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 934
    Height = 463
    inherited TBMain: TLFToolBar
      Width = 930
      inherited NavMain: THYMNavigator
        Width = 210
        DataSource = DMDiarioReparaciones.DSCabReparar
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 210
      end
      inherited EPMain: THYMEditPanel
        Left = 218
        Width = 37
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 255
      end
      inherited TbuttComp: TToolButton
        Left = 263
      end
      object PNLTitSerie: TLFPanel
        Left = 286
        Top = 0
        Width = 275
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LSerie: TLFLabel
          Left = 11
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object ETitSerie: TLFEdit
          Left = 110
          Top = 0
          Width = 160
          Height = 21
          TabStop = False
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
          TabOrder = 0
        end
        object EFSerie: TLFEditFind2000
          Left = 39
          Top = 0
          Width = 70
          Height = 21
          TabStop = False
          TabOrder = 1
          OnChange = EFSerieChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
    end
    object PNLFiltro: TLFPanel
      Left = 2
      Top = 28
      Width = 930
      Height = 61
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LHastaFecha: TLFLabel
        Left = 19
        Top = 31
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LDesdeFecha: TLFLabel
        Left = 16
        Top = 8
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object BEjercicio: TSpeedButton
        Left = 200
        Top = 5
        Width = 22
        Height = 22
        Hint = 'Ejercicio actual'
        Flat = True
        NumGlyphs = 2
        OnClick = BEjercicioClick
      end
      object BMes: TSpeedButton
        Left = 200
        Top = 27
        Width = 22
        Height = 22
        Hint = 'Mes actual'
        Flat = True
        NumGlyphs = 2
        OnClick = BMesClick
      end
      object BMesAnterior: TSpeedButton
        Left = 178
        Top = 27
        Width = 22
        Height = 22
        Hint = 'Mes anterior'
        Flat = True
        NumGlyphs = 2
        OnClick = BMesAnteriorClick
      end
      object BMesSiguiente: TSpeedButton
        Left = 222
        Top = 27
        Width = 22
        Height = 22
        Hint = 'Mes siguiente'
        Flat = True
        NumGlyphs = 2
        OnClick = BMesSiguienteClick
      end
      object BEjercicioAnterior: TSpeedButton
        Left = 178
        Top = 5
        Width = 22
        Height = 22
        Hint = 'Ejercicio anterior'
        Flat = True
        NumGlyphs = 2
        OnClick = BEjercicioAnteriorClick
      end
      object BEjercicioSiguiente: TSpeedButton
        Left = 222
        Top = 5
        Width = 22
        Height = 22
        Hint = 'Ejercicio siguiente'
        Flat = True
        NumGlyphs = 2
        OnClick = BEjercicioSiguienteClick
      end
      object DTPFecha_Hasta: TLFDateEdit
        Left = 84
        Top = 28
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPFecha_Desde: TLFDateEdit
        Left = 84
        Top = 6
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object BFiltrar: TButton
        Left = 256
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        TabOrder = 2
        OnClick = BFiltrarClick
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 89
      Width = 930
      Height = 372
      ActivePage = TSDiarioReparaciones
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 2
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSDiarioReparaciones: TTabSheet
        Caption = 'Diario Reparaciones'
        OnShow = TSDiarioReparacionesShow
        object DBGDiarioReparaciones: TNsDBGrid
          Left = 0
          Top = 0
          Width = 922
          Height = 344
          Align = alClient
          DataSource = DMDiarioReparaciones.DSCabReparar
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGDiarioReparacionesCellClick
          OnDrawColumnCell = DBGDiarioReparacionesDrawColumnCell
          OnDblClick = DBGDiarioReparacionesDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'IDCABREPARAR'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL_CLIENTE'
              Width = 250
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_AVISO'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_ENTRADA'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_PREV_SALIDA'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_HORA_CIERRE'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_HORA_CIERRE_ITV'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE_DOC'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG'
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FORMA_PAGO'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'S_BASES'
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'S_CUOTA_IVA'
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MATERIALES'
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_EMPLEADOS_TAREAS'
              Width = 300
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ESTADO'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_ESTADO'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SITUACION'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_SITUACION'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO_ACTUACION'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_TIPO_ACTUACION'
              Width = 100
              Visible = True
            end>
        end
      end
      object TSDiarioFacturacion: TTabSheet
        Caption = 'Diario Facturacion'
        ImageIndex = 1
        OnShow = TSDiarioFacturacionShow
        object DBGDiarioFacturacion: TNsDBGrid
          Left = 0
          Top = 0
          Width = 922
          Height = 344
          Align = alClient
          DataSource = DMDiarioReparaciones.DSxDiarioFac
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGDiarioReparacionesCellClick
          OnDrawColumnCell = DBGDiarioReparacionesDrawColumnCell
          OnDblClick = DBGDiarioReparacionesDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO'
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE_DOC'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'IDCABREPARAR'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MATRICULA'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MARCA'
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_CLIENTE'
              Width = 300
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NIF'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_ENTRADA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_SALIDA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'BASE'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'S_CUOTA_IVA'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TOTAL_FAC'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FORMA_PAGO'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_RECEPCION'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ESTADO_REP'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_ESTADO_REP'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SITUACION_REP'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_SITUACION_REP'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO_REPARACION'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_TIPO_REPARACION'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO_ACTUALCION'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_TIPO_ACTUALCION'
              Width = 100
              Visible = True
            end>
        end
      end
      object TSTrazabilidadCompras: TTabSheet
        Caption = 'Trazabilidad Compras'
        ImageIndex = 2
        OnShow = TSTrazabilidadComprasShow
        object DBGTrazabilidadCompras: TNsDBGrid
          Left = 0
          Top = 0
          Width = 922
          Height = 344
          Align = alClient
          DataSource = DMDiarioReparaciones.DSxTazabilidadCompras
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGDiarioReparacionesCellClick
          OnDrawColumnCell = DBGDiarioReparacionesDrawColumnCell
          OnDblClick = DBGDiarioReparacionesDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ALB_COMPRA'
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              Width = 300
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NUM_ALBARAN'
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOM_PROVEEDOR'
              Width = 250
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FAC_COMPRA'
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'IDCABREPARAR'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FAC_VENTA'
              Width = 120
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 463
    Width = 934
  end
  inherited CEMain: TControlEdit
    Left = 448
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 484
    Top = 4
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
    Left = 520
    Top = 0
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      Hint = 'Procesos'
      ImageIndex = 16
    end
    object AEnviarInformes: TAction
      Category = 'Procesos'
      Caption = 'Enviar Informes'
      Hint = 'Enviar Informes a Gerencia'
      ImageIndex = 105
      OnExecute = AEnviarInformesExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 560
    Top = 0
  end
end
