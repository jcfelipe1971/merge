inherited FSelecProyectosVentas: TFSelecProyectosVentas
  Left = 424
  Top = 260
  Caption = 'Selecci'#243'n de cabeceras de Ventas'
  ClientHeight = 446
  ClientWidth = 758
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
    object DBGVentasC: THYTDBGrid
      Left = 2
      Top = 28
      Width = 754
      Height = 367
      Align = alClient
      DataSource = DMProyectos.DSxVisorVentas
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGVentasCDblClick
      OnKeyDown = DBGVentasCKeyDown
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'B_COMISION'
        'CANAL'
        'CLIENTE'
        'EJERCICIO'
        'FECHA'
        'NOMBRE_COMERCIAL'
        'RIG'
        'SERIE')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Title.Alignment = taRightJustify
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANAL'
          Title.Alignment = taRightJustify
          Width = 44
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SERIE'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Title.Alignment = taRightJustify
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_COMERCIAL'
          Width = 285
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'B_COMISION'
          Title.Alignment = taRightJustify
          Width = 81
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 422
    Width = 758
  end
end
