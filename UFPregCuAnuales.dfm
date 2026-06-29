inherited FPregCuAnuales: TFPregCuAnuales
  Left = 871
  Top = 199
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Cuentas Anuales'
  ClientHeight = 220
  ClientWidth = 392
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 220
    inherited TBMain: TLFToolBar
      Width = 392
      object TButtConfiguracion: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object PNLComentario: TLFPanel
      Left = 0
      Top = 175
      Width = 392
      Height = 45
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Comentario: TLFLabel
        Left = 38
        Top = 14
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object EComentario: TLFEdit
        Left = 98
        Top = 10
        Width = 279
        Height = 21
        MaxLength = 35
        TabOrder = 0
      end
    end
    object PNLFechaMoneda: TLFPanel
      Left = 0
      Top = 36
      Width = 392
      Height = 139
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Fecha_del_listado: TLFLabel
        Left = 11
        Top = 43
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha del listado'
      end
      object LMoneda: TLFLabel
        Left = 52
        Top = 65
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object DTPFechaListado: TLFDateEdit
        Left = 98
        Top = 39
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DBETitMoneda: TLFDbedit
        Left = 144
        Top = 61
        Width = 234
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMCuAnuales.DSxMonedasListado
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEMoneda: TLFDbedit
        Left = 98
        Top = 61
        Width = 45
        Height = 21
        Color = clInfoBk
        DataField = 'MONEDA'
        DataSource = DMCuAnuales.DSQMCuentasAn
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object ChkBDesglosado: TLFCheckBox
        Left = 98
        Top = 87
        Width = 279
        Height = 17
        Caption = 'Desglosado por cuentas'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        OnClick = ChkBDesglosadoClick
        Alignment = taLeftJustify
      end
      object CBDesglosadoPri: TLFCheckBox
        Left = 98
        Top = 105
        Width = 279
        Height = 17
        Caption = 'Desglosado por cuentas a '#250'ltimo nivel'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Visible = False
        Alignment = taLeftJustify
      end
      object CBCuentasSaldoCero: TLFCheckBox
        Left = 98
        Top = 125
        Width = 279
        Height = 17
        Caption = 'Cuentascon Saldo Cero'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        Alignment = taLeftJustify
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 262
    Top = 46
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
