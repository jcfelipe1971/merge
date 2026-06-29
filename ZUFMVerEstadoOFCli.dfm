inherited ZFMVerEstadoOFCli: TZFMVerEstadoOFCli
  Left = 247
  Top = 233
  Width = 783
  Height = 540
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Estado de Ordenes de Clientes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 773
    Height = 487
    inherited TBMain: TLFToolBar
      Width = 769
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 41
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 1
      end
      object TSep: TToolButton
        Left = 41
        Top = 0
        Width = 10
        Style = tbsSeparator
      end
      object PnlCliente: TLFPanel
        Left = 51
        Top = 0
        Width = 415
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LCliente: TLFLabel
          Left = 10
          Top = 5
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
        end
        object EFCliente: TLFEditFind2000
          Left = 46
          Top = 1
          Width = 49
          Height = 21
          TabOrder = 0
          OnChange = EFClienteChange
          Base_de_datos = DMMain.DataBase
          Transaction = ZDMVerEstadoOFCli.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloCliente: TLFEdit
          Left = 96
          Top = 1
          Width = 315
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
          TabOrder = 1
        end
      end
      object TButtVerArbol: TToolButton
        Left = 466
        Top = 0
        Hint = 'Ver Arbol'
        Caption = 'Ver Arbol'
        ImageIndex = 137
        OnClick = TButtVerArbolClick
      end
    end
    object TVArbol: TTreeView
      Left = 2
      Top = 28
      Width = 769
      Height = 457
      Align = alClient
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Indent = 19
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited TBActions: TLFToolBar
    Top = 487
    Width = 773
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
end
