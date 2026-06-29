inherited FMConfINI: TFMConfINI
  Left = 365
  Top = 245
  HelpContext = 331
  Caption = 'Configuraci'#243'n del Fichero INI'
  ClientHeight = 379
  ClientWidth = 497
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 497
    Height = 355
    inherited TBMain: TLFToolBar
      Width = 493
      object TBReleer: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Releer Datos'
        Caption = 'TBReleer'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = TBReleerClick
      end
      object TBGrabar: TToolButton [1]
        Left = 23
        Top = 0
        Hint = 'Grabar Datos'
        Caption = 'TBGrabar'
        ImageIndex = 41
        ParentShowHint = False
        ShowHint = True
        OnClick = TBGrabarClick
      end
      inherited EPMain: THYMEditPanel
        Left = 46
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 493
      Height = 325
      ActivePage = TSGLS
      Align = alClient
      OwnerDraw = True
      TabIndex = 3
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSConexion: TTabSheet
        Caption = 'Conexion'
        object LUsuarioBD: TLFLabel
          Left = 24
          Top = 79
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usuario de la BDD'
        end
        object LBaseDatos: TLFLabel
          Left = 42
          Top = 57
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Base de Datos'
        end
        object LRolBD: TLFLabel
          Left = 44
          Top = 101
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Rol de la BDD'
        end
        object LClaveBD: TLFLabel
          Left = 59
          Top = 123
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Clave BDD'
        end
        object LBaseDeDatosCab: TLFLabel
          Left = 6
          Top = 35
          Width = 84
          Height = 13
          Caption = 'Base de Datos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EDBaseDatos: TLFEdit
          Left = 117
          Top = 53
          Width = 355
          Height = 21
          TabOrder = 0
        end
        object EDUsuarioBD: TLFEdit
          Left = 117
          Top = 75
          Width = 355
          Height = 21
          TabOrder = 1
        end
        object EDRolBD: TLFEdit
          Left = 117
          Top = 97
          Width = 355
          Height = 21
          TabOrder = 2
        end
        object EClaveBD: TLFEdit
          Left = 117
          Top = 119
          Width = 355
          Height = 21
          PasswordChar = '*'
          TabOrder = 3
        end
      end
      object TSFirma: TTabSheet
        Caption = 'Firma'
        ImageIndex = 1
        object LTimerBusqueda: TLFLabel
          Left = 19
          Top = 82
          Width = 101
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tiempo de B'#250'squeda'
        end
        object LDispositivoFirma: TLFLabel
          Left = 41
          Top = 60
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dispositivo Firma'
        end
        object LOtros: TLFLabel
          Left = 14
          Top = 35
          Width = 31
          Height = 13
          Caption = 'Otros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EDTimerBusqueda: TLFEdit
          Left = 125
          Top = 79
          Width = 140
          Height = 21
          TabOrder = 0
        end
        object EDispositivoFirma: TLFEdit
          Left = 125
          Top = 57
          Width = 140
          Height = 21
          TabOrder = 1
        end
      end
      object TSImpresion: TTabSheet
        Caption = 'Impresion'
        ImageIndex = 2
        object LPedidos: TLFLabel
          Left = 52
          Top = 68
          Width = 151
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#250'mero de Informes en Pedidos'
        end
        object LAlbaranes: TLFLabel
          Left = 43
          Top = 91
          Width = 160
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#250'mero de Informes en Albaranes'
        end
        object LOfertas: TLFLabel
          Left = 56
          Top = 45
          Width = 147
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#250'mero de Informes en Ofertas'
        end
        object LFacturas: TLFLabel
          Left = 49
          Top = 115
          Width = 154
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#250'mero de Informes en Facturas'
        end
        object SEPedidos: TSpinEdit
          Left = 208
          Top = 64
          Width = 41
          Height = 22
          MaxValue = 4
          MinValue = 1
          TabOrder = 1
          Value = 1
        end
        object SEOfertas: TSpinEdit
          Left = 208
          Top = 41
          Width = 41
          Height = 22
          MaxValue = 4
          MinValue = 1
          TabOrder = 0
          Value = 1
        end
        object SEFacturas: TSpinEdit
          Left = 208
          Top = 111
          Width = 41
          Height = 22
          MaxValue = 4
          MinValue = 1
          TabOrder = 3
          Value = 1
        end
        object SEAlbaranes: TSpinEdit
          Left = 208
          Top = 87
          Width = 41
          Height = 22
          MaxValue = 4
          MinValue = 1
          TabOrder = 2
          Value = 1
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 355
    Width = 497
  end
  inherited CEMain: TControlEdit
    Left = 256
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 289
    Top = 4
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
  inherited ALMain: TLFActionList
    Left = 322
    Top = 4
  end
  inherited FSMain: TLFFibFormStorage
    Left = 356
    Top = 4
  end
end
