object FInformacionEnvioDte: TFInformacionEnvioDte
  Left = 548
  Top = 283
  Width = 351
  Height = 359
  Caption = 'Informaci'#243'n Envio Dte'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TLFPanel
    Left = 0
    Top = 0
    Width = 343
    Height = 332
    Align = alClient
    Caption = 'PnlMain'
    TabOrder = 0
    object LBLGeneral: TLFLabel
      Left = 1
      Top = 1
      Width = 341
      Height = 64
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Enviando DTE'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = 23
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object PnlLog: TLFPanel
      Left = 1
      Top = 216
      Width = 341
      Height = 115
      Align = alClient
      TabOrder = 0
      object MLog: TLFMemo
        Left = 1
        Top = 1
        Width = 339
        Height = 113
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'MLog')
        ParentFont = False
        TabOrder = 0
      end
    end
    object GBProcesaCab: TGroupBox
      Left = 1
      Top = 65
      Width = 341
      Height = 151
      Align = alTop
      Caption = 'Proceando Envio Dte'
      TabOrder = 1
      object LFolio: TLFLabel
        Left = 120
        Top = 91
        Width = 6
        Height = 13
        Caption = '0'
      end
      object LTituloTipoDocTributario: TLFLabel
        Left = 24
        Top = 25
        Width = 95
        Height = 13
        Caption = 'Tipo Doc. Trib. :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LTituloRutReceptor: TLFLabel
        Left = 24
        Top = 47
        Width = 81
        Height = 13
        Caption = 'Rut Receptor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LTituloRig: TLFLabel
        Left = 24
        Top = 69
        Width = 27
        Height = 13
        Caption = 'RIG:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LTituloFolio: TLFLabel
        Left = 24
        Top = 91
        Width = 32
        Height = 13
        Caption = 'Folio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LTituloCliente: TLFLabel
        Left = 24
        Top = 113
        Width = 44
        Height = 13
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LTipoDocTributario: TLFLabel
        Left = 120
        Top = 25
        Width = 22
        Height = 13
        Caption = 'DES'
      end
      object LRutReceptor: TLFLabel
        Left = 120
        Top = 47
        Width = 6
        Height = 13
        Caption = '0'
      end
      object LRig: TLFLabel
        Left = 120
        Top = 69
        Width = 6
        Height = 13
        Caption = '0'
      end
      object LCliente: TLFLabel
        Left = 120
        Top = 113
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
  end
end
