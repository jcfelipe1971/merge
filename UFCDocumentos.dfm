object FCDocumentos: TFCDocumentos
  Left = 561
  Top = 622
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Documentos'
  ClientHeight = 220
  ClientWidth = 392
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
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 23
    Height = 220
    Align = alLeft
    AutoSize = True
    EdgeBorders = [ebBottom]
    EdgeInner = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TButtGrabar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Cerrar la ventana'
      Caption = 'Grabar'
      ImageIndex = 41
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = TButtGrabarClick
    end
  end
  object DBGProcedencia: THYTDBGrid
    Left = 23
    Top = 0
    Width = 369
    Height = 220
    Align = alClient
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
    AutoDeseleccionar = True
    PermutaPaneles = False
    CamposAOrdenarImgs = DMMain.ILOrdGrid
    CampoAOrdenarColor = clInfoBk
    OrdenMultiple = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EJERCICIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RIG'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LINEA'
        Width = 46
        Visible = True
      end>
  end
end
