object FMNumeroDeSerieCompraDev: TFMNumeroDeSerieCompraDev
  Left = 208
  Top = 103
  Width = 685
  Height = 338
  Caption = 'Nros. de Serie - Devolucion de Compras'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TLFPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 49
    Align = alTop
    TabOrder = 0
    DesignSize = (
      677
      49)
    object Label3: TLFLabel
      Left = 6
      Top = 2
      Width = 53
      Height = 16
      Caption = 'Articulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLFLabel
      Left = 113
      Top = 2
      Width = 40
      Height = 16
      Caption = 'Titulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EArticulo: TLFEdit
      Left = 5
      Top = 20
      Width = 103
      Height = 21
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object ETitulo: TLFEdit
      Left = 108
      Top = 20
      Width = 564
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TLFPanel
    Left = 0
    Top = 49
    Width = 677
    Height = 64
    Align = alTop
    TabOrder = 1
    object Label5: TLFLabel
      Left = 17
      Top = 4
      Width = 79
      Height = 16
      Caption = 'Devoluci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LDevolucion: TLFLabel
      Left = 16
      Top = 23
      Width = 81
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = '5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label6: TLFLabel
      Left = 124
      Top = 4
      Width = 75
      Height = 16
      Caption = 'Asignados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LCantidadAsignada: TLFLabel
      Left = 120
      Top = 23
      Width = 81
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = '5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label1: TLFLabel
      Left = 64
      Top = 45
      Width = 63
      Height = 16
      Caption = 'Devuelto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLFLabel
      Left = 403
      Top = 45
      Width = 67
      Height = 16
      Caption = 'Asignado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BOK: TButton
      Left = 240
      Top = 11
      Width = 145
      Height = 33
      Caption = 'OK'
      Enabled = False
      TabOrder = 0
      OnClick = BOKClick
    end
  end
  object Panel4: TLFPanel
    Left = 193
    Top = 113
    Width = 484
    Height = 198
    Align = alClient
    TabOrder = 2
    object DBGAsignado: TDBGrid
      Left = 1
      Top = 1
      Width = 482
      Height = 196
      Align = alClient
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGAsignadoDblClick
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALMACEN_ENT'
          ReadOnly = True
          Width = 51
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'NRO_SERIE'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EJERCICIO_ENT'
          ReadOnly = True
          Width = 49
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CANAL_ENT'
          ReadOnly = True
          Width = 36
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE_ENT'
          ReadOnly = True
          Width = 39
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG_ENT'
          ReadOnly = True
          Width = 43
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA_ENT'
          ReadOnly = True
          Width = 34
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_ENT'
          ReadOnly = True
          Width = 96
          Visible = True
        end>
    end
  end
  object Panel3: TLFPanel
    Left = 0
    Top = 113
    Width = 193
    Height = 198
    Align = alLeft
    TabOrder = 3
    object DBGDevuelto: TDBGrid
      Left = 1
      Top = 1
      Width = 192
      Height = 196
      Align = alLeft
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGDevueltoDblClick
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'NRO_SERIE'
          ReadOnly = True
          Width = 163
          Visible = True
        end>
    end
  end
end
