inherited FMBuscaAsientosxImp: TFMBuscaAsientosxImp
  Left = 274
  Top = 198
  Caption = 'Buscar asientos por importes'
  ClientHeight = 343
  ClientWidth = 792
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 792
    Height = 319
    inherited TBMain: TLFToolBar
      Width = 788
      EdgeBorders = [ebBottom]
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 112
        DataSource = DMBuscaAsientosxImp.DSxAsientosDet
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 112
      end
      inherited EPMain: THYMEditPanel
        Left = 120
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      inherited TSepTerc: TToolButton
        Left = 153
      end
      inherited TbuttComp: TToolButton
        Left = 161
      end
      object TButtSeparador: TToolButton
        Left = 184
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLImporte: TLFPanel
        Left = 192
        Top = 0
        Width = 313
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LBImporte: TLFLabel
          Left = 17
          Top = 4
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importe'
        end
        object LBMasMenos: TLFLabel
          Left = 116
          Top = 4
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = '+/-'
        end
        object LTipo: TLFLabel
          Left = 183
          Top = 4
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo'
        end
        object EDTImporte: TLFEdit
          Left = 56
          Top = 0
          Width = 57
          Height = 21
          TabOrder = 0
          OnKeyUp = EDTImporteKeyUp
        end
        object EDTMasMenos: TLFEdit
          Left = 133
          Top = 0
          Width = 25
          Height = 21
          TabOrder = 1
          Text = '0'
          OnKeyUp = EDTImporteKeyUp
        end
        object UpDown: TUpDown
          Left = 158
          Top = 0
          Width = 15
          Height = 21
          Associate = EDTMasMenos
          Min = 0
          Max = 1000
          Position = 0
          TabOrder = 2
          Wrap = False
        end
        object CBAsiento: TLFComboBox
          Left = 208
          Top = 0
          Width = 101
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = 'Todos'
          Items.Strings = (
            'Todos'
            'Debe'
            'Haber')
        end
      end
      object TButtBuscar: TToolButton
        Left = 505
        Top = 0
        Hint = 'Buscar'
        Caption = 'Buscar'
        ImageIndex = 85
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtBuscarClick
      end
    end
    object DBGFMain: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 788
      Height = 289
      Align = alClient
      Color = clInfoBk
      DataSource = DMBuscaAsientosxImp.DSxAsientosDet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGFMainDrawColumnCell
      OnDblClick = DBGFMainDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'DOC_FECHA'
        'DOC_NUMERO'
        'DOC_SERIE'
        'IMPORTE'
        'RIC'
        'TEXTO'
        'TIPO'
        'ASIENTO'
        'FECHA'
        'EJERCICIO')
      ColumnasCheckBoxes.Strings = (
        'PUNTEO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ASIENTO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cargo'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Abono'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEXTO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_SERIE'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_NUMERO'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_FECHA'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIC'
          Width = 65
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 319
    Width = 792
  end
  inherited CEMain: TControlEdit
    Left = 432
    Top = 96
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 464
    Top = 96
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMirefresh: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 344
    Top = 72
  end
  inherited FSMain: TLFFibFormStorage
    Left = 288
    Top = 72
  end
end
