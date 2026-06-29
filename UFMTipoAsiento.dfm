inherited FMTipoAsiento: TFMTipoAsiento
  Left = 281
  Top = 105
  Width = 452
  Height = 375
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de tipos de asiento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 442
    Height = 322
    inherited TBMain: TLFToolBar
      Width = 438
      Caption = 'TBMain'
      inherited NavMain: THYMNavigator
        Width = 232
        DataSource = DMTipoAsiento.DSSysTipoAsiento
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 232
      end
      inherited EPMain: THYMEditPanel
        Left = 240
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 265
      end
      inherited TbuttComp: TToolButton
        Left = 273
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 438
      Height = 292
      Align = alClient
      DataSource = DMTipoAsiento.DSSysTipoAsiento
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
      AutoPostEnCheckBox = False
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
        'TIPO'
        'TITULO'
        'DEFECTO'
        'VISIBLE'
        'RESTRICCION')
      ColumnasCheckBoxes.Strings = (
        'DEFECTO'
        'VISIBLE'
        'RESTRICCION')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0')
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
          FieldName = 'TIPO'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 227
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEFECTO'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VISIBLE'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESTRICCION'
          Width = 40
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 322
    Width = 442
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
  end
end
