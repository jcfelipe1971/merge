inherited FSelecProyectosCompras: TFSelecProyectosCompras
  Left = 448
  Top = 341
  Caption = 'Selecci'#243'n de cabeceras de Compras'
  ClientHeight = 446
  ClientWidth = 758
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 758
    Height = 422
    inherited TBMain: TLFToolBar
      Width = 754
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickSalir = EPMainClickSalir
      end
    end
    object PNLPie: TLFPanel
      Left = 2
      Top = 395
      Width = 754
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      Caption = 
        'Selecccione la documento con Intro y Salga con Escape. ESPACIO p' +
        'ara seleccionar lineas individuales.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object DBGComprasC: THYTDBGrid
      Left = 2
      Top = 28
      Width = 754
      Height = 367
      Align = alClient
      DataSource = DMProyectos.DSVisorCompras
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGComprasCDblClick
      OnKeyDown = DBGComprasCKeyDown
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'CANAL'
        'EJERCICIO'
        'FECHA'
        'NOMBRE_COMERCIAL'
        'PROVEEDOR'
        'RIG'
        'S_BASES'
        'SERIE')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Title.Alignment = taRightJustify
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANAL'
          Title.Alignment = taRightJustify
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 30
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SERIE'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG'
          Title.Alignment = taRightJustify
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROVEEDOR'
          Title.Alignment = taRightJustify
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_COMERCIAL'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'S_BASES'
          Title.Alignment = taRightJustify
          Width = 84
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 422
    Width = 758
  end
  inherited CEMain: TControlEdit
    Left = 512
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 544
    Top = 0
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
    Left = 592
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 624
    Top = 0
  end
end
