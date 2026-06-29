inherited FSelecProyectosVentasDetalle: TFSelecProyectosVentasDetalle
  Left = 480
  Top = 458
  Caption = 'Selecci'#243'n de detalles de Ventas'
  ClientHeight = 343
  ClientWidth = 592
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 319
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 588
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickSalir = EPMainClickSalir
      end
    end
    object DBGVentasC: THYTDBGrid
      Left = 2
      Top = 28
      Width = 588
      Height = 264
      Align = alClient
      DataSource = DMProyectos.DSxVisorVentasDetalle
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
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
        'ARTICULO'
        'B_IMPONIBLE'
        'DESCUENTO'
        'PRECIO'
        'TITULO'
        'UNIDADES')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 241
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Title.Alignment = taRightJustify
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Title.Alignment = taRightJustify
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'B_IMPONIBLE'
          Title.Alignment = taRightJustify
          Width = 66
          Visible = True
        end>
    end
    object PNLPie: TLFPanel
      Left = 2
      Top = 292
      Width = 588
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Selecccione la linea con Intro y Salga con Escape.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited TBActions: TLFToolBar
    Top = 319
    Width = 592
    Caption = 'Selecccione la linea con Intro y Salga con Escape.'
    TabOrder = 0
  end
end
