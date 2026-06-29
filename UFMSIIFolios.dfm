inherited FMSIIFolios: TFMSIIFolios
  Left = 555
  Top = 211
  Caption = 'Folios'
  ClientHeight = 369
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 345
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMSIIFolios.DSQMFolios
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Height = 315
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 287
          inherited G2KTableLoc: TG2KTBLoc
            Top = 24
            CamposADesplegar.Strings = (
              'SERIE'
              'NUMERO_INICIO'
              'NUMERO_FINAL')
            DataSource = DMSIIFolios.DSQMFolios
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SII_FOLIOS'
            CampoNum = 'ID'
            CampoStr = 'TIPO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID')
          end
          object LSerie: TLFLabel
            Left = 108
            Top = 10
            Width = 24
            Height = 13
            Caption = 'Serie'
          end
          object LTipo: TLFLabel
            Left = 111
            Top = 54
            Width = 21
            Height = 13
            Caption = 'Tipo'
          end
          object LFechaAutorizacion: TLFLabel
            Left = 65
            Top = 78
            Width = 67
            Height = 13
            Caption = 'F.Autorizaci'#243'n'
          end
          object LNumeroInicio: TLFLabel
            Left = 79
            Top = 99
            Width = 53
            Height = 13
            Caption = 'Num. Inicio'
          end
          object LNumeroFinal: TLFLabel
            Left = 82
            Top = 121
            Width = 50
            Height = 13
            Caption = 'Num. Final'
          end
          object LContador: TLFLabel
            Left = 89
            Top = 143
            Width = 43
            Height = 13
            Caption = 'Contador'
          end
          object LTipoDocTributario: TLFLabel
            Left = 41
            Top = 33
            Width = 91
            Height = 13
            Caption = 'Tipo Doc Tributario'
          end
          object LComentario: TLFLabel
            Left = 79
            Top = 190
            Width = 53
            Height = 13
            Caption = 'Comentario'
          end
          object CBActivo: TLFDBCheckBox
            Left = 137
            Top = 163
            Width = 121
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            Enabled = False
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMSIIFolios.DSQMFolios
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFSerie: TLFDBEditFind2000
            Left = 137
            Top = 7
            Width = 70
            Height = 21
            DataField = 'SERIE'
            DataSource = DMSIIFolios.DSQMFolios
            TabOrder = 0
            OnChange = DBEFSerieChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            CampoADevolver = 'SERIE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFEchaAutorizacion: TLFDBDateEdit
            Left = 137
            Top = 73
            Width = 96
            Height = 21
            DataField = 'FECHA_AUTORIZACION'
            DataSource = DMSIIFolios.DSQMFolios
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 3
          end
          object DBENumeroInicio: TLFDbedit
            Left = 137
            Top = 95
            Width = 70
            Height = 21
            Color = clInfoBk
            DataField = 'NUMERO_INICIO'
            DataSource = DMSIIFolios.DSQMFolios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBENumeroFinal: TLFDbedit
            Left = 137
            Top = 117
            Width = 70
            Height = 21
            Color = clInfoBk
            DataField = 'NUMERO_FINAL'
            DataSource = DMSIIFolios.DSQMFolios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBEContador: TLFDbedit
            Left = 137
            Top = 139
            Width = 70
            Height = 21
            Color = clInfoBk
            DataField = 'CONTADOR'
            DataSource = DMSIIFolios.DSQMFolios
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object DBEFTipoDocTributario: TLFDBEditFind2000
            Left = 137
            Top = 29
            Width = 70
            Height = 21
            DataField = 'TIPO_DOC_TRIBUTARIO'
            DataSource = DMSIIFolios.DSQMFolios
            TabOrder = 7
            OnChange = DBEFTipoDocTributarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SII_TIPO_DOCUMENTO_TRIBUTARIO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            CampoADevolver = 'CODIGO'
            CondicionBusqueda = 'VISIBLE_FAC = 1 OR VISIBLE_ALB = 1 OR CODIGO = '#39'DES'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object DBMComentario: TLFDBMemo
            Left = 137
            Top = 185
            Width = 312
            Height = 82
            DataField = 'COMENTARIO'
            DataSource = DMSIIFolios.DSQMFolios
            Enabled = False
            TabOrder = 10
          end
          object ETituloSerie: TLFEdit
            Left = 208
            Top = 7
            Width = 241
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object ETituloDocTributario: TLFEdit
            Left = 208
            Top = 29
            Width = 241
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBCBTipo: TLFDBComboBoxValue
            Left = 137
            Top = 51
            Width = 312
            Height = 21
            DataField = 'TIPO'
            DataSource = DMSIIFolios.DSQMFolios
            ItemHeight = 13
            Items.Strings = (
              'OFC -  Oferta Cliente'
              'PEC - Pedido - Cliente'
              'ALB -Albaran - Cliente'
              'FAC - Factura - Cliente'
              'OFP - Oferta - Proveedor'
              'PEP - Pedido - Proveedor'
              'ALP -Albaran - Proveedor'
              'FAP -Factura - Proveedor')
            Values.Strings = (
              'OFC'
              'PEC'
              'ALB'
              'FAC'
              'OFP'
              'PEP'
              'ALP'
              'FAP')
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = DMSIIFolios.DSQMFolios
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '2')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_AUTORIZACION'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_INICIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_FINAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTADOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_DOC_TRIBUTARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 37
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 345
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 384
    Top = 32
    object AAgregaXmlFolios: TAction
      Category = 'Procesos'
      Caption = 'Agrega Xml Folios'
      ImageIndex = 60
      OnExecute = AAgregaXmlFoliosExecute
    end
    object AAsignaUltimoFolio: TAction
      Category = 'Procesos'
      Caption = 'Asigna Ultimo Folio'
      ImageIndex = 25
      OnExecute = AAsignaUltimoFolioExecute
    end
    object ALimpiaFolioEnviado: TAction
      Category = 'Procesos'
      Caption = 'Limpia un Folio Enviado'
      ImageIndex = 27
      OnExecute = ALimpiaFolioEnviadoExecute
    end
    object AAsignaContadorFolioAlUltimoDelCaf: TAction
      Category = 'Procesos'
      Caption = 'Asigna Contador Folio al '#250'ltimo del CAF'
      Hint = 'Asigna Contador Folio al '#250'ltimo del CAF'
      ImageIndex = 61
      OnExecute = AAsignaContadorFolioAlUltimoDelCafExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 424
    Top = 16
  end
end
