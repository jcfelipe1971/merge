inherited ProFMLstEscandalloDesg: TProFMLstEscandalloDesg
  Left = 480
  Top = 291
  Caption = 'Listado de escandallo desglosado'
  ClientHeight = 289
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 223
    inherited PCMain: TLFPageControl [0]
      Height = 171
    end
    inherited TBMain: TLFToolBar [1]
    end
    inherited PBListado: TProgressBar [2]
      Top = 207
      TabOrder = 3
    end
    object GBOrden: TGroupBox
      Left = 0
      Top = 36
      Width = 592
      Height = 171
      Align = alClient
      TabOrder = 2
      object LblOrden: TLFLabel
        Left = 35
        Top = 65
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Escandallo'
      end
      object LCompuesto: TLFLabel
        Left = 34
        Top = 86
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Compuesto'
      end
      object EFEscandallo: TLFEditFind2000
        Left = 91
        Top = 61
        Width = 79
        Height = 21
        TabOrder = 0
        OnChange = EFEscandalloChange
        OnKeyUp = EFEscandalloKeyUp
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ESCANDALLO'
        CampoStr = 'COMPUESTO'
        CondicionBusqueda = 'tipo='#39'EPR'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'PRO_ESCANDALLO'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ESCANDALLO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEArtOrd: TLFDbedit
        Left = 91
        Top = 83
        Width = 79
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'COMPUESTO'
        DataSource = ProDMLstEscandalloDesg.DSEscandallo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnChange = DBEArtOrdChange
      end
      object EArtDesc: TLFEdit
        Left = 171
        Top = 83
        Width = 374
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 223
    inherited LComentario: TLFLabel
      Left = 35
    end
    inherited LOrden: TLFLabel
      Left = 414
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 8
    end
    inherited EComentario: TLFEdit
      Left = 91
      Width = 296
      TabOrder = 1
    end
    inherited CBOrden: TLFComboBox
      Left = 485
      Width = 30
      TabOrder = 2
      TabStop = False
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 91
      TabOrder = 0
    end
  end
  inherited ALMain: TLFActionList
    Left = 348
    Top = 58
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
