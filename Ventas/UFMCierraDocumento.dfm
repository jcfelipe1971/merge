inherited FMCierraDocumento: TFMCierraDocumento
  Left = 391
  Top = 272
  Width = 759
  Height = 451
  HelpContext = 209
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Cierre Masivo de Documentos'
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 749
    Height = 398
    inherited TBMain: TLFToolBar
      Width = 745
      TabOrder = 1
      inherited NavMain: THYMNavigator
        DataSource = DMCierraDocumento.DSQMCabeceras
        Hints.Strings = ()
        TabOrder = 2
      end
      inherited EPMain: THYMEditPanel
        Width = 33
        DataSource = DMCierraDocumento.DSQMCabeceras
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 261
      end
      inherited TbuttComp: TToolButton
        Left = 269
      end
      object TButtSep3: TToolButton
        Left = 292
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LSerie: TLFLabel
        Left = 300
        Top = 0
        Width = 45
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '&Serie'
        FocusControl = DBLCBSerie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object DBLCBSerie: TDBLookupComboBox
        Left = 345
        Top = 0
        Width = 133
        Height = 21
        DropDownWidth = 250
        KeyField = 'SERIE'
        ListField = 'SERIE;TITULO'
        ListFieldIndex = 1
        ListSource = DMCierraDocumento.DSxSeries
        TabOrder = 0
        OnClick = TButtRefrescarClick
      end
      object TButtSep4: TToolButton
        Left = 478
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtTodos: TToolButton
        Left = 486
        Top = 0
        Hint = 'Marcar todos los Documentos'
        Caption = 'Todos'
        ImageIndex = 146
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtTodosClick
      end
      object TButtDesmarcar: TToolButton
        Left = 509
        Top = 0
        Hint = 'Quita la marca de todos los Documentos'
        Caption = 'Desmarcar'
        ImageIndex = 147
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtDesmarcarClick
      end
      object TButtRefrescar: TToolButton
        Left = 532
        Top = 0
        Hint = 'Refresca la informaci'#243'n en pantalla'
        Caption = 'Refrescar'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtRefrescarClick
      end
      object TButtSep2: TToolButton
        Left = 555
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtCerrar: TToolButton
        Left = 563
        Top = 0
        Hint = 'Cerrar Documentos Marcados'
        Caption = 'Cerrar'
        ImageIndex = 68
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtCerrarClick
      end
    end
    object DBGCierraDocumento: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 745
      Height = 368
      Align = alClient
      DataSource = DMCierraDocumento.DSQMCabeceras
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGCierraDocumentoDblClick
      IniStorage = FSMain
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
        'AGENTE'
        'ALMACEN'
        'ASIENTO'
        'B_COMISION'
        'B_DTO_LINEAS'
        'BRUTO'
        'BULTOS'
        'C_TOTAL'
        'CAMPANYA'
        'CLIENTE'
        'CONTACTO'
        'DEVOLUCION'
        'DIRECCION'
        'DTO_CIAL'
        'DTO_PP'
        'EJERCICIO'
        'EMPLEADO_ATENCION'
        'EMPLEADO_RESPONSABLE'
        'ESTADO'
        'FECHA'
        'FECHA_ENTREGA'
        'FORMA_PAGO'
        'I_DTO_CIAL'
        'I_DTO_PP'
        'I_PORTES'
        'IDIOMA'
        'IMPORTE_ANTICIPO'
        'INDICE'
        'LIQUIDO'
        'MONEDA'
        'NIF'
        'NOMBRE_COMERCIAL'
        'P_RETENCION'
        'POR_PORTES'
        'PORTES'
        'PROYECTO'
        'RANGO'
        'RECC'
        'RECT'
        'RIG'
        'S_BASES'
        'S_CUOTA_IVA'
        'S_CUOTA_RE'
        'SERIE'
        'SU_REFERENCIA'
        'TARIFA'
        'TERCERO'
        'TIPO_IRPF'
        'TIPO_PORTES'
        'TIT_CONTACTO'
        'TITULO'
        'TOTAL_A_COBRAR'
        'TRANSPORTISTA'
        'ENTRADA_FACTURACION'
        'PEDIDO_CLIENTE'
        'Z_OBSERVACION')
      ColumnasCheckBoxes.Strings = (
        'ENTRADA_FACTURACION')
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
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clAqua
          Expanded = False
          FieldName = 'RIG'
          ReadOnly = True
          Width = 48
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CLIENTE'
          ReadOnly = True
          Width = 56
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 278
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA'
          ReadOnly = True
          Width = 59
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SU_REFERENCIA'
          ReadOnly = True
          Width = 128
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FORMA_PAGO'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA_FACTURACION'
          Width = 36
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 749
  end
  inherited CEMain: TControlEdit
    DataSource = DMCierraDocumento.DSQMCabeceras
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
  inherited FSMain: TLFFibFormStorage
    Left = 255
    Top = 165
  end
end
