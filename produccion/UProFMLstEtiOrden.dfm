inherited ProFMLstEtiOrden: TProFMLstEtiOrden
  Left = 517
  Top = 214
  Caption = 'Listado de Orden de Producci'#243'n'
  ClientHeight = 282
  ClientWidth = 416
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 416
    Height = 216
    inherited TBMain: TLFToolBar
      Width = 416
    end
    inherited PBListado: TProgressBar
      Top = 200
      Width = 416
      TabOrder = 3
    end
    inherited PCMain: TLFPageControl
      Width = 416
      Height = 164
    end
    object PanelCentral: TLFPanel
      Left = 0
      Top = 36
      Width = 416
      Height = 164
      Align = alClient
      TabOrder = 2
      object LNroEtiquetas: TLFLabel
        Left = 110
        Top = 124
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'N'#186' Etiquetas'
      end
      object LabelOrd: TLFLabel
        Left = 73
        Top = 102
        Width = 96
        Height = 13
        Alignment = taRightJustify
        Caption = 'N'#186' Etiquetas Vac'#237'as'
      end
      object LUnidadesPorCaja: TLFLabel
        Left = 118
        Top = 10
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Uds x Caja'
      end
      object LCajasPorBulto: TLFLabel
        Left = 108
        Top = 32
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cajas x Bulto'
      end
      object LUnidades: TLFLabel
        Left = 124
        Top = 54
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidades'
      end
      object LUnidadesXBulto: TLFLabel
        Left = 89
        Top = 76
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidades x Bulto'
      end
      object LPrimeraEtiqueta: TLFLabel
        Left = 92
        Top = 146
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Primera Etiqueta'
      end
      object EEtiquetasVacias: TLFEdit
        Left = 172
        Top = 99
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object EEtiquetas: TLFEdit
        Left = 172
        Top = 121
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object EUnidadesPorCaja: TLFEdit
        Left = 172
        Top = 7
        Width = 121
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object ECajasPorBulto: TLFEdit
        Left = 172
        Top = 29
        Width = 121
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
      object EUnidades: TLFEdit
        Left = 172
        Top = 51
        Width = 121
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object BUnidades: TButton
        Left = 296
        Top = 118
        Width = 33
        Height = 25
        Caption = 'Uds'
        TabOrder = 6
        OnClick = BUnidadesClick
      end
      object BCajas: TButton
        Left = 332
        Top = 118
        Width = 33
        Height = 25
        Caption = 'Cajas'
        TabOrder = 7
        OnClick = BCajasClick
      end
      object BBultos: TButton
        Left = 368
        Top = 118
        Width = 33
        Height = 25
        Caption = 'Bultos'
        TabOrder = 8
        OnClick = BBultosClick
      end
      object EUnidadesXBulto: TLFEdit
        Left = 172
        Top = 73
        Width = 121
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
      object EPrimeraEtiqueta: TLFEdit
        Left = 172
        Top = 143
        Width = 121
        Height = 21
        TabOrder = 9
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 216
    Width = 416
    Visible = False
    inherited LComentario: TLFLabel
      Left = 31
      Visible = False
    end
    inherited LOrden: TLFLabel
      Left = 200
      Width = 133
      Caption = 'Ordenado por (NO VISIBLE)'
    end
    inherited LFechaListado: TLFLabel
      Left = 6
      Visible = False
    end
    inherited EComentario: TLFEdit
      Left = 90
      Width = 408
      TabOrder = 1
      Visible = False
    end
    inherited CBOrden: TLFComboBox
      Left = 342
      Width = 72
      TabOrder = 2
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 90
      TabOrder = 0
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 472
    Top = 50
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 12
  end
end
