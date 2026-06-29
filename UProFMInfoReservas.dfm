inherited ProFMInfoReservas: TProFMInfoReservas
  Left = 406
  Top = 361
  Width = 1011
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Informaci'#243'n de Reservas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1001
    inherited TBMain: TLFToolBar
      Width = 997
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object ToolButton1: TToolButton
        Left = 33
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRefrescar: TToolButton
        Left = 41
        Top = 0
        Hint = 'Refrescar Datos'
        Caption = 'Refrescar Datos'
        ImageIndex = 26
        OnClick = TButtRefrescarClick
      end
    end
    object DBGReservas: TFIBHYGGridFind
      Left = 2
      Top = 28
      Width = 997
      Height = 302
      Align = alClient
      Color = clInfoBk
      DataSource = ProDMInfoReservas.DSQReservas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGReservasDrawColumnCell
      OnDblClick = DBGReservasDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'LINEA_RES'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG_OF'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_ORDEN'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALMACEN_LAN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALMACEN_SAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPUESTO'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 282
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_LOTE_RESERVA'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOTE_RESERVA'
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLASIFICACION_LOTE_RESERVA'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 38
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 1001
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
end
