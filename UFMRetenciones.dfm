inherited FMRetenciones: TFMRetenciones
  Left = 442
  Top = 188
  Caption = 'Introducci'#243'n Manual Retenciones'
  ClientHeight = 334
  ClientWidth = 777
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 777
    Height = 310
    inherited TBMain: TLFToolBar
      Width = 773
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 132
        DataSource = DMRetenciones.DSQMRetenciones
        VisibleButtons = [nbPrior, nbNext, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        TabOrder = 1
        EditaControl = DBGMain
      end
      inherited TSepNav: TToolButton
        Left = 132
      end
      inherited EPMain: THYMEditPanel
        Left = 140
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 0
      end
      inherited TSepTerc: TToolButton
        Left = 163
      end
      inherited TbuttComp: TToolButton
        Left = 171
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 773
      Height = 280
      Align = alClient
      DataSource = DMRetenciones.DSQMRetenciones
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
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
        'TIPO_IVA')
      CamposNoAccesibles.Strings = (
        'TIPO_IVA')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID_CARTERA_DETALLE'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CUENTA_ITBIS'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE_RETENCION'
          Width = 75
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CUENTA_ISR'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE_ISR'
          Width = 75
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_RETENCION'
          ReadOnly = True
          Width = 54
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'BASE'
          ReadOnly = True
          Width = 75
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO'
          ReadOnly = True
          Width = 75
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RESTO'
          ReadOnly = True
          Width = 75
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 310
    Width = 777
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
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
