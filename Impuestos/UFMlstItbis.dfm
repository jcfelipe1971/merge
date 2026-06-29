object FMLstItbis: TFMLstItbis
  Left = 477
  Top = 183
  Width = 814
  Height = 392
  Caption = 'Listado General de Itbis'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLFiltro: TLFPanel
    Left = 0
    Top = 0
    Width = 806
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object LFFechaDesde: TLFLabel
      Left = 12
      Top = 12
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Desde'
    end
    object LFFechaHasta: TLFLabel
      Left = 212
      Top = 12
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Hasta'
    end
    object LTipoMov: TLFLabel
      Left = 424
      Top = 12
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Mov.'
    end
    object DEFechaDesdeMovimientos: TLFDateEdit
      Left = 80
      Top = 8
      Width = 117
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 0
      Text = '01/01/2000'
    end
    object DEFechaHastaMovimientos: TLFDateEdit
      Left = 276
      Top = 8
      Width = 121
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
    object CBTipoMov: TLFComboBox
      Left = 477
      Top = 8
      Width = 115
      Height = 21
      DropDownCount = 7
      ItemHeight = 13
      TabOrder = 2
      Text = 'Todos'
      Items.Strings = (
        'Todos')
    end
    object BExtraer: TButton
      Left = 620
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Extraer'
      TabOrder = 3
    end
    object BExportar: TButton
      Left = 720
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Exportar'
      TabOrder = 4
    end
  end
  object PNLDatos: TLFPanel
    Left = 0
    Top = 45
    Width = 806
    Height = 320
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGMovItbis: THYTDBGrid
      Left = 0
      Top = 0
      Width = 806
      Height = 320
      Align = alClient
      Color = clInfoBk
      DataSource = DMLstItbis.DSxmovItbis
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoDeseleccionar = True
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'DOC_FECHA'
        'DOC_NUMERO'
        'DOC_SERIE'
        'EJERCICIO'
        'NIF'
        'NOMBRE_COMERCIAL')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REGISTRO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_CLI_PRO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCIMIENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_NUMERO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_SERIE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_FECHA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOCUMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RETENCION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_RETENCION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_FACTURA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_FACTURA1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE_RETENCION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE_ISR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_FECHA1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUENTA_ITBIS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUENTA_ISR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_NCF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TERCERO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_COMERCIAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NIF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONO01'
          Visible = True
        end>
    end
  end
end
