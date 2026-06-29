inherited FMSeleccion: TFMSeleccion
  Caption = 'Seleccion'
  ClientHeight = 174
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 150
    object LTipo: TLFLabel [0]
      Left = 62
      Top = 67
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo'
    end
    inherited TBMain: TLFToolBar
      object TBOk: TToolButton [0]
        Left = 0
        Top = 0
        Caption = 'Ok'
        ImageIndex = 25
        OnClick = TBOkClick
      end
      object ToolButton2: TToolButton [1]
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 31
        Width = 26
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object EFCodigo: TLFEditFind2000
      Left = 88
      Top = 64
      Width = 81
      Height = 21
      MaxLength = 3
      TabOrder = 1
      OnChange = EFCodigoChange
      OnKeyUp = OnKeyUp
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CLIENTE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CLIENTES_EF'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFCodigoBusqueda
      OnExiste = EFCodigoExiste
      OnNoExiste = EFCodigoNoExiste
      OrdenadoPor.Strings = (
        'CLIENTE')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = EntornoBusqueda
    end
    object ETitulo: TLFEdit
      Left = 170
      Top = 64
      Width = 287
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 2
      OnKeyUp = OnKeyUp
    end
    object DateEdit: TLFDateEdit
      Left = 88
      Top = 88
      Width = 121
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 3
      OnKeyUp = OnKeyUp
    end
    object DTPHora: TDateTimePicker
      Left = 208
      Top = 88
      Width = 73
      Height = 21
      CalAlignment = dtaLeft
      Date = 42394.7616949653
      Time = 42394.7616949653
      DateFormat = dfShort
      DateMode = dmUpDown
      Kind = dtkTime
      ParseInput = False
      TabOrder = 4
      OnKeyUp = OnKeyUp
    end
  end
  inherited TBActions: TLFToolBar
    Top = 150
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
  object EntornoBusqueda: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 440
    Top = 48
  end
end
