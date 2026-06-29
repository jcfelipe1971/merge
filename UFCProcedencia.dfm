inherited FCProcedencia: TFCProcedencia
  Left = 425
  Top = 292
  BorderIcons = [biSystemMenu]
  Caption = 'Procedencia'
  ClientHeight = 289
  ClientWidth = 495
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 495
    Height = 265
    inherited TBMain: TLFToolBar
      Width = 491
      EdgeBorders = [ebBottom]
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object DBGProcedencia: THYTDBGrid
      Left = 2
      Top = 28
      Width = 491
      Height = 235
      Align = alClient
      BorderStyle = bsNone
      Color = clInfoBk
      DataSource = DMAlbaranes.DSQSPProcedencia
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGProcedenciaDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      PermutaPaneles = False
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'EJERCICIO_O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Ejercicio'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANAL_O'
          Title.Caption = 'Canal'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE_O'
          Title.Caption = 'Serie'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_O'
          Title.Caption = 'Tipo'
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG_O'
          Title.Caption = 'RIG'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Title.Caption = 'Fecha'
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_O'
          Title.Caption = 'Linea'
          Width = 48
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 265
    Width = 495
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
