object FMVerHistoricoDeCosteKri: TFMVerHistoricoDeCosteKri
  Left = 489
  Top = 206
  Width = 578
  Height = 364
  Caption = 'Historico de Coste'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLCabecera: TLFPanel
    Left = 0
    Top = 0
    Width = 570
    Height = 49
    Align = alTop
    TabOrder = 0
    object LArticulo: TLFLabel
      Left = 23
      Top = 19
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Articulo'
    end
    object Earticulo: TLFEdit
      Left = 62
      Top = 15
      Width = 97
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
    object ETituloArticulo: TLFEdit
      Left = 160
      Top = 15
      Width = 234
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
  end
  object PNLDetalle: TLFPanel
    Left = 0
    Top = 49
    Width = 570
    Height = 288
    Align = alClient
    TabOrder = 1
    object DBGMain: THYTDBGrid
      Left = 1
      Top = 1
      Width = 568
      Height = 286
      Align = alClient
      DataSource = DMVerHistoricoDeCosteKri.DSxVerHistoricoCostes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = False
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      PermutaPaneles = False
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE'
          ReadOnly = True
          Width = 29
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA'
          ReadOnly = True
          Width = 63
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COD_PROV'
          ReadOnly = True
          Width = 58
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PROVEEDOR'
          ReadOnly = True
          Width = 158
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COSTE'
          ReadOnly = True
          Width = 51
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCUENTO1'
          ReadOnly = True
          Width = 38
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCUENTO2'
          ReadOnly = True
          Width = 38
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCUENTO3'
          ReadOnly = True
          Width = 39
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CON_DESCUENTO'
          ReadOnly = True
          Width = 53
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'USUARIO'
          ReadOnly = True
          Visible = True
        end>
    end
  end
end
