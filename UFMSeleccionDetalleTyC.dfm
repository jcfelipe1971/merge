inherited FMSeleccionDetalleTyC: TFMSeleccionDetalleTyC
  Left = 280
  Top = 235
  Width = 1024
  Height = 500
  ActiveControl = EFModelo
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Seleccion'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1014
    Height = 447
    inherited TBMain: TLFToolBar
      Width = 1010
      inherited EPMain: THYMEditPanel
        Width = 41
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBSep1: TToolButton
        Left = 41
        Top = 0
        Width = 32
        Style = tbsSeparator
      end
      object TBGuardar: TToolButton
        Left = 73
        Top = 0
        Hint = 'Guardar'
        Caption = 'Guardar'
        ImageIndex = 19
        OnClick = TBGuardarClick
      end
    end
    object PNLFiltro: TLFPanel
      Left = 2
      Top = 28
      Width = 1010
      Height = 49
      Align = alTop
      TabOrder = 1
      object LModelo: TLFLabel
        Left = 34
        Top = 7
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Modelo'
      end
      object LUnidadExtendida: TLFLabel
        Left = 13
        Top = 29
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Mts. Bobina'
      end
      object EFModelo: TLFEditFind2000
        Left = 74
        Top = 3
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = EFModeloChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'REF_PROVEEDOR'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS_MODELOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EModelo: TLFEdit
        Left = 196
        Top = 3
        Width = 400
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 1
        Text = 'EModelo'
      end
      object EUnidadExtendida: TLFEdit
        Left = 74
        Top = 25
        Width = 121
        Height = 21
        TabOrder = 2
        Text = '250'
      end
    end
    object SGDetalle: TStringGrid
      Left = 2
      Top = 77
      Width = 1010
      Height = 368
      Align = alClient
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 2
      OnDrawCell = SGDetalleDrawCell
    end
  end
  inherited TBActions: TLFToolBar
    Top = 447
    Width = 1014
  end
  inherited CEMain: TControlEdit
    Left = 344
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 380
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
    Left = 416
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 456
    Top = 0
  end
end
