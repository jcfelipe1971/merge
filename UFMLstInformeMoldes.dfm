inherited FMLstInformeMoldes: TFMLstInformeMoldes
  Left = 454
  Top = 232
  Caption = 'Listado Informe Moldes'
  ClientHeight = 212
  ClientWidth = 522
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 522
    Height = 140
    inherited TBMain: TLFToolBar
      Width = 522
    end
    inherited PCMain: TLFPageControl
      Width = 522
      Height = 104
    end
    object GBMoldes: TGroupBox
      Left = 0
      Top = 36
      Width = 522
      Height = 104
      Align = alClient
      TabOrder = 2
      object LblMolde: TLFLabel
        Left = 35
        Top = 24
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Molde'
      end
      object EFMolde: TLFEditFind2000
        Left = 68
        Top = 20
        Width = 62
        Height = 21
        TabOrder = 0
        OnChange = EFMoldeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'NUM_MOLDE'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_MOLDES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'NUM_MOLDE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFDescMolde: TLFEdit
        Left = 131
        Top = 20
        Width = 373
        Height = 21
        Color = clInfoBk
        TabOrder = 1
      end
      object LFLinea: TLFEditFind2000
        Left = 68
        Top = 48
        Width = 62
        Height = 21
        TabOrder = 2
        OnChange = EFMoldeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'LINEA'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_MOLDES_REPARACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = LFLineaBusqueda
        OrdenadoPor.Strings = (
          'LINEA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object LFDescLinea: TLFEdit
        Left = 131
        Top = 48
        Width = 373
        Height = 21
        Color = clInfoBk
        TabOrder = 3
      end
      object CBLinea: TLFCheckBox
        Left = 18
        Top = 50
        Width = 47
        Height = 17
        Caption = 'Linea'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBLineaChange
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 140
    Width = 522
    Height = 72
    inherited LComentario: TLFLabel
      Left = 42
    end
    inherited LOrden: TLFLabel
      Left = 221
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 16
    end
    inherited EComentario: TLFEdit
      Left = 101
    end
    inherited CBOrden: TLFComboBox
      Left = 290
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 101
    end
  end
  inherited ALMain: TLFActionList
    Left = 360
    Top = 62
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
