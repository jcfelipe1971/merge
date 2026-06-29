inherited FMRectificacionAsientos: TFMRectificacionAsientos
  Left = 448
  Top = 307
  Caption = 'Rectificaci'#243'n de Asientos'
  ClientHeight = 358
  ClientWidth = 592
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 334
    object LBInformacion: TLFLabel [0]
      Left = 2
      Top = 28
      Width = 588
      Height = 13
      Align = alTop
      Caption = 'Asientos contables con apuntes negativos:'
    end
    inherited TBMain: TLFToolBar
      Width = 588
      TabOrder = 1
      object TBAceptar: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Rectificar todos los asientos negativos'
        Caption = 'Rectificar todos los asientos negativos'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TBAceptarClick
      end
      object TBRefresca: TToolButton [1]
        Left = 23
        Top = 0
        Hint = 'Refrescar Tabla'
        Caption = 'Refresca'
        ImageIndex = 26
        OnClick = TBRefrescaClick
      end
      object TBSeparador1: TToolButton [2]
        Left = 46
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 54
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object PNLSeleccionCanal: TLFPanel
        Left = 87
        Top = 0
        Width = 185
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LCanal: TLFLabel
          Left = 29
          Top = 3
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Canal'
        end
        object CBCanal: TLFComboBox
          Left = 61
          Top = 0
          Width = 124
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBCanalChange
          Items.Strings = (
            'Todos los canales')
        end
      end
    end
    object LFPCentral: TLFPanel
      Left = 2
      Top = 41
      Width = 588
      Height = 287
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object DBGAsientos: THYTDBGrid
        Left = 2
        Top = 0
        Width = 586
        Height = 285
        Color = clInfoBk
        DataSource = DMRectificacionAsientos.DSxRectificacion_Tabla
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGAsientosCellClick
        OnDrawColumnCell = DBGAsientosDrawColumnCell
        OnDblClick = DBGAsientosDblClick
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        AutoDeseleccionar = True
        PermutaPaneles = False
        CamposAOrdenarImgs = DMMain.ILOrdGrid
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'ASIENTO'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIC'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 62
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
            FieldName = 'TIPO'
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBE'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HABER'
            Width = 62
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 334
    Width = 592
    ParentColor = False
  end
end
