inherited FMTPVSincronizacion: TFMTPVSincronizacion
  Left = 436
  Top = 213
  Caption = 'Sincronizaci'#243'n'
  ClientWidth = 624
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object LFLabel1: TLFLabel [0]
    Left = 288
    Top = 11
    Width = 30
    Height = 13
    Caption = 'Ticket'
  end
  inherited PMain: TLFPanel
    Width = 624
    inherited TBMain: TLFToolBar
      Width = 620
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    object PTop: TLFPanel
      Left = 2
      Top = 28
      Width = 620
      Height = 61
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LSerie: TLFLabel
        Left = 12
        Top = 14
        Width = 24
        Height = 13
        Caption = 'Serie'
      end
      object LBase: TLFLabel
        Left = 14
        Top = 34
        Width = 24
        Height = 13
        Caption = 'Base'
      end
      object LSesion: TLabel
        Left = 212
        Top = 11
        Width = 32
        Height = 13
        Caption = 'Sesion'
      end
      object LRit: TLFLabel
        Left = 346
        Top = 11
        Width = 18
        Height = 13
        Caption = 'RIT'
      end
      object LNumTicket: TLFLabel
        Left = 310
        Top = 35
        Width = 55
        Height = 13
        Caption = 'Num Ticket'
      end
      object ESerie: TLFEdit
        Left = 51
        Top = 10
        Width = 150
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 0
        Text = 'ESerie'
      end
      object BTraspaso: TBitBtn
        Left = 526
        Top = 9
        Width = 77
        Height = 40
        Caption = 'Traspasar'
        TabOrder = 1
        OnClick = BTraspasoClick
      end
      object EBaseDestino: TLFEdit
        Left = 51
        Top = 30
        Width = 238
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 2
        Text = 'ServidorFB:xpress_local'
      end
      object ESesion: TEdit
        Left = 248
        Top = 8
        Width = 33
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 3
        Text = '1'
      end
      object ERit: TLFEdit
        Left = 370
        Top = 8
        Width = 78
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 4
      end
      object ENumTicket: TLFEdit
        Left = 370
        Top = 32
        Width = 78
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 5
      end
    end
    object PCuerpo: TLFPanel
      Left = 2
      Top = 89
      Width = 620
      Height = 241
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object MSalida: TLFMemo
        Left = 0
        Top = 0
        Width = 393
        Height = 241
        Align = alLeft
        Lines.Strings = (
          'MSalida')
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 393
        Top = 0
        Width = 227
        Height = 241
        Align = alClient
        TabOrder = 1
        object LContadorClientes: TLFLabel
          Left = 10
          Top = 0
          Width = 3
          Height = 13
          Layout = tlCenter
        end
        object LContadorCabTickets: TLabel
          Left = 10
          Top = 35
          Width = 3
          Height = 13
          Layout = tlCenter
        end
        object LContadorDetTickets: TLabel
          Left = 10
          Top = 70
          Width = 3
          Height = 13
          Layout = tlCenter
        end
        object LContadorTicFP: TLabel
          Left = 10
          Top = 105
          Width = 3
          Height = 13
          Layout = tlCenter
        end
        object LContadorSesCajaTurnoFP: TLabel
          Left = 10
          Top = 140
          Width = 3
          Height = 13
        end
        object LContadorSesCajaTurno: TLabel
          Left = 10
          Top = 175
          Width = 3
          Height = 13
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Width = 624
  end
  inherited CEMain: TControlEdit
    Left = 328
    Top = 260
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 364
    Top = 260
  end
  inherited ALMain: TLFActionList
    Left = 416
    Top = 272
    object ASincronizar: TAction
      Caption = 'Sincronizar'
      OnExecute = ASincronizarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 456
    Top = 272
  end
end
