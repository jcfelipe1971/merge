object ProFMSelecReloj: TProFMSelecReloj
  Left = 326
  Top = 146
  Width = 512
  Height = 316
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Seleccion de reloj'
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
  object PanelMain: TLFPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 289
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object DBGReloj: TDBGrid
      Left = 1
      Top = 1
      Width = 501
      Height = 249
      DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RUTA'
          Width = 280
          Visible = True
        end>
    end
    object BotoOk: TBitBtn
      Left = 155
      Top = 256
      Width = 80
      Height = 30
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = BotoOkClick
    end
    object BotoCancel: TBitBtn
      Left = 251
      Top = 256
      Width = 80
      Height = 30
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
      OnClick = BotoCancelClick
    end
  end
  object FormStorage: TFormStorage
    UseRegistry = False
    StoredValues = <>
    Left = 416
    Top = 128
  end
end
