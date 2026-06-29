inherited FMSIITipoDTE: TFMSIITipoDTE
  Left = 553
  Top = 246
  Width = 639
  Height = 471
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'SII Tipo DTE'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 629
    Height = 418
    inherited TBMain: TLFToolBar
      Width = 625
      inherited NavMain: THYMNavigator
        Width = 160
        DataSource = DMSIITipoDTE.DSQTipoDTE
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 160
      end
      inherited EPMain: THYMEditPanel
        Left = 168
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 193
      end
      inherited TbuttComp: TToolButton
        Left = 201
      end
    end
    object DBGTipoDTE: TFIBHYGGridFind
      Left = 2
      Top = 28
      Width = 625
      Height = 388
      Align = alClient
      Color = clInfoBk
      DataSource = DMSIITipoDTE.DSQTipoDTE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
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
      ColumnasCheckBoxes.Strings = (
        'VISIBLE_ALB'
        'VISIBLE_FAC')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'VISIBLE_ALB'
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'VISIBLE_FAC'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 418
    Width = 629
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
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
end
