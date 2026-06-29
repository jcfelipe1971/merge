inherited ZFMLstTroqueles: TZFMLstTroqueles
  Left = 472
  Top = 370
  Caption = 'Listado Troqueles'
  ClientHeight = 161
  ClientWidth = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 495
    Height = 104
    inherited TBMain: TLFToolBar
      Width = 495
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      inherited TButtPrevisualizar: TToolButton
        OnClick = nil
      end
    end
    inherited PCMain: TLFPageControl
      Width = 495
      Height = 68
    end
    object PanelCentral: TLFPanel
      Left = 0
      Top = 36
      Width = 495
      Height = 68
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LblTroquel: TLFLabel
        Left = 43
        Top = 21
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Troquel'
      end
      object EFTroquel: TLFEditFind2000
        Left = 83
        Top = 17
        Width = 67
        Height = 21
        TabOrder = 0
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'AVANCE'
          'CILINDRO')
        CampoADevolver = 'TROQUEL'
        CampoNum = 'TROQUEL'
        CampoStr = 'ANCHO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_TROQUELES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TROQUEL')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 104
    Width = 495
    Height = 57
    Visible = False
  end
  inherited ALMain: TLFActionList
    Left = 252
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
