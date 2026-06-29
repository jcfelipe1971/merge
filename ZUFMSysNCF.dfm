inherited ZFMSysNCF: TZFMSysNCF
  Left = 468
  Top = 181
  Caption = 'Mantenimiento de Contadores'
  ClientHeight = 346
  ClientWidth = 648
  PixelsPerInch = 96
  TextHeight = 13
  object LFLabel1: TLFLabel [0]
    Left = 288
    Top = 83
    Width = 45
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tipo NCF'
  end
  inherited PMain: TLFPanel
    Width = 648
    Height = 157
    inherited TBMain: TLFToolBar
      Width = 644
      inherited NavMain: THYMNavigator
        DataSource = ZDMSysNCF.DSQMCabecera
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEFTipo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    inherited PCMain: TLFPageControl
      Width = 644
      Height = 127
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 636
          Height = 99
          inherited G2KTableLoc: TG2KTBLoc
            Left = 83
            Top = 41
            DataSource = ZDMSysNCF.DSQMCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_SYS_NCF_CAB'
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LblTipo: TLFLabel
            Left = 63
            Top = 10
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LblSerie: TLFLabel
            Left = 330
            Top = 10
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LblDescripcion: TLFLabel
            Left = 29
            Top = 54
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object Z_LblTipoNCF: TLFLabel
            Left = 40
            Top = 31
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo NCF'
          end
          object LBLVersionXML: TLFLabel
            Left = 298
            Top = 31
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Version XML'
          end
          object DBEFTipo: TLFDBEditFind2000
            Left = 89
            Top = 6
            Width = 59
            Height = 21
            DataField = 'TIPO'
            DataSource = ZDMSysNCF.DSQMCabecera
            TabOrder = 0
            OnChange = DBEFTipoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_MOVIMIENTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'TIPO IN ('#39'FAC'#39', '#39'FAP'#39', '#39'FCR'#39')'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBEFSerie: TLFDBEditFind2000
            Left = 362
            Top = 6
            Width = 77
            Height = 21
            DataField = 'SERIE'
            DataSource = ZDMSysNCF.DSQMCabecera
            TabOrder = 3
            OnChange = DBEFSerieChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescripcion: TLFDbedit
            Left = 89
            Top = 50
            Width = 201
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMSysNCF.DSQMCabecera
            TabOrder = 2
          end
          object DescSerie: TLFHYDBDescription
            Left = 440
            Top = 6
            Width = 151
            Height = 21
            Color = clInfoBk
            DataSource = ZDMSysNCF.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Tabla_a_buscar = 'SYS_SERIES'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'SERIE')
            CamposWhereTabla.Strings = (
              'SERIE')
          end
          object DescTipo: TLFHYDBDescription
            Left = 149
            Top = 6
            Width = 141
            Height = 21
            Color = clInfoBk
            DataSource = ZDMSysNCF.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Tabla_a_buscar = 'SYS_TIPO_MOVIMIENTO'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPO')
            CamposWhereTabla.Strings = (
              'TIPO')
          end
          object DBChkBDefecto: TLFDBCheckBox
            Left = 362
            Top = 52
            Width = 121
            Height = 17
            Caption = 'Defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = ZDMSysNCF.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBVersionXML: TDBComboBoxValue
            Left = 362
            Top = 28
            Width = 77
            Height = 21
            Style = csDropDownList
            DataField = 'VERSION_XML'
            DataSource = ZDMSysNCF.DSQMCabecera
            DropDownCount = 6
            ItemHeight = 13
            Items.Strings = (
              'Versi'#243'n 2'
              'Versi'#243'n 3')
            Values.Strings = (
              '2'
              '3')
            TabOrder = 4
          end
          object DBCBVTipoNCF: TDBLookupComboBox
            Left = 89
            Top = 28
            Width = 201
            Height = 21
            DataField = 'TIPO_NCF'
            DataSource = ZDMSysNCF.DSQMCabecera
            KeyField = 'TIPO_NCF'
            ListField = 'TITULO'
            ListSource = ZDMSysNCF.DSxTipoNCF
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 636
          Height = 99
          DataSource = ZDMSysNCF.DSQMCabecera
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 225
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_NCF'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              Width = 50
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 157
    Width = 648
    Height = 165
    inherited TBDetalle: TLFToolBar
      Width = 648
      inherited NavDetalle: THYMNavigator
        DataSource = ZDMSysNCF.DSQMDetalle
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 648
      Height = 143
      DataSource = ZDMSysNCF.DSQMDetalle
      PopupMenu = nil
      ColumnasCheckBoxes.Strings = (
        'ACTIVO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PREFIJO'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_INI'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_FIN'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTADOR_INI'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTADOR_FIN'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTADOR_ACTUAL'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACTIVO'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FOLIO_INI'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FOLIO_FIN'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_APROBACION'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ANO_APROBACION'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE_DIR'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VERSION'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FICHERO'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLAVE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CERTIFICADO'
          Width = 90
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 322
    Width = 648
  end
  inherited ALMain: TLFActionList
    Top = 11
  end
  inherited FSMain: TLFFibFormStorage
    Top = 11
  end
end
