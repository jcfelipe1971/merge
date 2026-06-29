inherited FMAsignaBancoRemesa: TFMAsignaBancoRemesa
  Left = 304
  Top = 158
  Width = 640
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Asigna Banco Remesa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 630
    inherited TBMain: TLFToolBar
      Width = 626
      object PNLFiltroAgrupacion: TLFPanel [0]
        Left = 0
        Top = 0
        Width = 321
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LAgrupacion: TLFLabel
          Left = 10
          Top = 3
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Agrupacion'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EFAgrupacion: TLFEditFind2000
          Left = 80
          Top = 0
          Width = 57
          Height = 21
          TabOrder = 0
          OnChange = EFAgrupacionChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGRUPACION'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'TIPO='#39'C'#39
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_AGRUPACIONES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'AGRUPACION')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object EAgrupacion: TLFEdit
          Left = 138
          Top = 0
          Width = 180
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
        end
      end
      inherited EPMain: THYMEditPanel
        Left = 321
        Width = 22
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PNLSeleccion: TLFPanel
      Left = 2
      Top = 28
      Width = 450
      Height = 302
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PNLDatosRecibo: TLFPanel
        Left = 0
        Top = 0
        Width = 450
        Height = 97
        Align = alTop
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        DesignSize = (
          450
          97)
        object LNombreCliente: TLFLabel
          Left = 24
          Top = 53
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nombre Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LBanco: TLFLabel
          Left = 64
          Top = 9
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LPoblacion: TLFLabel
          Left = 48
          Top = 31
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Poblacion'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LFormaPago: TLFLabel
          Left = 24
          Top = 74
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = 'Forma de Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBENombreCliente: TLFDbedit
          Left = 99
          Top = 49
          Width = 347
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'NOMBRE_R_SOCIAL'
          DataSource = DMAsignaBancoRemesa.DSxCliente
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEBanco: TLFDbedit
          Left = 99
          Top = 5
          Width = 347
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAsignaBancoRemesa.DSxBancoCliente
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEPoblacion: TLFDbedit
          Left = 99
          Top = 27
          Width = 347
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAsignaBancoRemesa.DSxDireccionCliente
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBETituloFormaPago: TLFDbedit
          Left = 154
          Top = 71
          Width = 292
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAsignaBancoRemesa.DSxFormaPago
          Enabled = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEFormaPago: TLFDbedit
          Left = 100
          Top = 71
          Width = 51
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'FORMA_PAGO'
          DataSource = DMAsignaBancoRemesa.DSxCarteraDetalle
          Enabled = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      object PNLRecibos: TLFPanel
        Left = 0
        Top = 97
        Width = 450
        Height = 205
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGRecibos: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 450
          Height = 205
          Align = alClient
          DataSource = DMAsignaBancoRemesa.DSxCarteraDetalle
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = False
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
          BuscarNums = True
          Campos.Strings = (
            'BANCO_KRI')
          CamposAMostrar.Strings = (
            'BANCO_KRI'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            'BANCO')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'COD_CLI_PRO'
            'DOC_FECHA'
            'DOC_NUMERO'
            'DOC_SERIE'
            'FORMA_PAGO'
            'LIQUIDO'
            'VENCIMIENTO')
          CamposNoAccesibles.Strings = (
            'CANAL'
            'COD_CLI_PRO'
            'DOC_FECHA'
            'DOC_NUMERO'
            'DOC_SERIE'
            'EJERCICIO'
            'EMPRESA'
            'FORMA_PAGO'
            'LINEA'
            'LIQUIDO'
            'RECIBIDO'
            'REGISTRO'
            'SIGNO'
            'VENCIMIENTO')
          MensajeNoExiste = False
          Numericos.Strings = (
            'BANCO')
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tablas.Strings = (
            'EMP_BANCOS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COD_CLI_PRO'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VENCIMIENTO'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FORMA_PAGO'
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DOC_SERIE'
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DOC_NUMERO'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DOC_FECHA'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANCO_KRI'
              Width = 40
              Visible = True
            end>
        end
      end
    end
    object PNLTotalesBanco: TLFPanel
      Left = 452
      Top = 28
      Width = 176
      Height = 302
      Align = alRight
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 2
      object DBGTotalesBanco: TDBGrid
        Left = 0
        Top = 0
        Width = 176
        Height = 302
        Align = alClient
        DataSource = DMAsignaBancoRemesa.DSxBancos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'BANCO'
            ReadOnly = True
            Width = 46
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'EUROS'
            ReadOnly = True
            Width = 89
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Width = 630
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
