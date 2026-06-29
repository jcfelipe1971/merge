inherited FMCambiaFacCli: TFMCambiaFacCli
  Left = 442
  Top = 188
  Caption = 'Introducci'#243'n Manual de IVA y Rec.'
  ClientHeight = 289
  ClientWidth = 757
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 757
    Height = 265
    inherited TBMain: TLFToolBar
      Width = 753
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 132
        DataSource = DMCambiaFacCli.DSQMTipoIva
        VisibleButtons = [nbPrior, nbNext, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        TabOrder = 1
        EditaControl = DBGCierraDocumento
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
    object DBGCierraDocumento: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 753
      Height = 235
      Align = alClient
      DataSource = DMCambiaFacCli.DSQMTipoIva
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
          DropDownRows = 4
          Expanded = False
          FieldName = 'TIPO_IVA'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 60
          Visible = True
        end
        item
          DropDownRows = 4
          Expanded = False
          FieldName = 'I_IVA'
          Title.Alignment = taRightJustify
          Width = 111
          Visible = True
        end
        item
          DropDownRows = 4
          Expanded = False
          FieldName = 'I_RE'
          Title.Alignment = taRightJustify
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_IVA_CANAL'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_RE_CANAL'
          Width = 101
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_IMPUESTO_ADICIONAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_IMPUESTO_ADICIONAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I_IMPUESTO_ADICIONAL_CANAL'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 265
    Width = 757
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
