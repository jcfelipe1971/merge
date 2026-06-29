inherited FMCierreApertura: TFMCierreApertura
  Left = 454
  Top = 192
  HelpContext = 244
  Caption = 'Cierre y Apertura del Ejercicio'
  ClientHeight = 246
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 222
    object BBRegulariza: TSpeedButton [0]
      Left = 23
      Top = 30
      Width = 215
      Height = 36
      Hint = 'Crear asiento de regularizaci'#243'n'
      Caption = 'Crear Asiento de Regularizaci'#243'n'
      Flat = True
      Margin = 5
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BBRegularizaClick
    end
    object BBCierra: TSpeedButton [1]
      Left = 23
      Top = 82
      Width = 215
      Height = 36
      Caption = 'Crear Asiento de Cierre'
      Flat = True
      Margin = 5
      NumGlyphs = 2
      OnClick = BBCierraClick
    end
    object BBBorraReg: TSpeedButton [2]
      Left = 265
      Top = 30
      Width = 215
      Height = 36
      Caption = 'Borrar Asiento de Regularizaci'#243'n'
      Flat = True
      Margin = 5
      NumGlyphs = 2
      OnClick = BBBorraRegClick
    end
    object BBBorraCierre: TSpeedButton [3]
      Left = 265
      Top = 82
      Width = 215
      Height = 36
      Caption = 'Borrar Asiento de Cierre'
      Flat = True
      Margin = 5
      NumGlyphs = 2
      OnClick = BBBorraCierreClick
    end
    object BBBorraApertura: TSpeedButton [4]
      Left = 265
      Top = 134
      Width = 215
      Height = 36
      Caption = 'Borrar Asiento de Apertura'
      Flat = True
      Margin = 5
      NumGlyphs = 2
      OnClick = BBBorraAperturaClick
    end
    object BBApertura: TSpeedButton [5]
      Left = 23
      Top = 134
      Width = 215
      Height = 36
      Caption = 'Crear Asiento de Apertura'
      Flat = True
      Margin = 5
      NumGlyphs = 2
      OnClick = BBAperturaClick
    end
    inherited TBMain: TLFToolBar
      TabOrder = 1
      Visible = False
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    object BBSalir: TBitBtn
      Left = 201
      Top = 192
      Width = 101
      Height = 36
      Hint = 'Salir de la ventana'
      Caption = '&Salir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BtnSalirClick
    end
  end
  inherited TBActions: TLFToolBar
    Top = 222
  end
end
