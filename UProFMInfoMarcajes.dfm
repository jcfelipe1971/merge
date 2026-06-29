inherited ProFMInfoMarcajes: TProFMInfoMarcajes
  Left = 406
  Top = 361
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Informaci'#243'n de Marcajes'
  ClientWidth = 1071
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1071
    inherited TBMain: TLFToolBar
      Width = 1067
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
        Caption = 'Refrescar Datos'
        ImageIndex = 26
        OnClick = TButtRefrescarClick
      end
    end
    object DBGMarcajes: TFIBHYGGridFind
      Left = 2
      Top = 28
      Width = 1067
      Height = 302
      Align = alClient
      Color = clInfoBk
      DataSource = ProDMInfoMarcajes.DSQMarcajes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGMarcajesDrawColumnCell
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
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      ColumnasCheckBoxes.Strings = (
        'HORAS_NO_PRODUCTIVAS')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'IDTAREA'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_FASE'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_TAREA'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_REAL'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_INICIO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_FIN'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIEMPO'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_FAB'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_DEFECTUOSAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD_RECHAZADA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_RECURSO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RECURSO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_RECURSO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_RECURSO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OPERARIO'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_EMPLEADO'
          Width = 265
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MAQUINA'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_MAQUINA'
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAUSA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_CAUSA'
          Width = 232
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TURNO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_TURNO'
          Width = 225
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EFICIENCIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NO_PRODUCTIVA'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORAS_NO_PRODUCTIVAS'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 1071
  end
  inherited CEMain: TControlEdit
    Left = 248
    Top = 228
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 284
    Top = 228
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
    Left = 320
    Top = 232
  end
  inherited FSMain: TLFFibFormStorage
    Left = 352
    Top = 232
  end
end
