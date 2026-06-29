object FMVerificacionesImpuestos: TFMVerificacionesImpuestos
  Left = 217
  Top = 110
  Width = 1100
  Height = 600
  Caption = 'Verificaciones Impuestos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PCMain: TLFPageControl
    Left = 0
    Top = 29
    Width = 1092
    Height = 544
    ActivePage = TSIntracomunitarios
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 0
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSIntracomunitarios: TTabSheet
      Caption = 'Intracomunitarios'
      object Splitter1: TSplitter
        Left = 0
        Top = 175
        Width = 1084
        Height = 8
        Cursor = crVSplit
        Align = alTop
      end
      object Splitter6: TSplitter
        Left = 0
        Top = 334
        Width = 1084
        Height = 7
        Cursor = crVSplit
        Align = alBottom
      end
      object PNLIntraClientes: TLFPanel
        Left = 0
        Top = 0
        Width = 1084
        Height = 175
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LIntraClientes: TLFLabel
          Left = 0
          Top = 29
          Width = 1084
          Height = 13
          Align = alTop
          Caption = 
            'Clientes cuyo Modo de IVA, pais y marca Intrastat no se correspo' +
            'nden'
          Color = clInfoBk
          ParentColor = False
        end
        object DBGIntraClientes: THYTDBGrid
          Left = 0
          Top = 42
          Width = 1084
          Height = 133
          Align = alClient
          Color = clInfoBk
          DataSource = DMVerificacionesImpuestos.DSxClientesIntra
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGIntraClientesDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'DIR_COMPLETA_N'
            'INTRA'
            'MODO_IVA'
            'NOMBRE_R_SOCIAL'
            'PAIS'
            'PERTENECE_CEE'
            'TITULO'
            'TITULO1')
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 300
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'INTRA'
              Width = 35
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'MODO_IVA'
              Width = 55
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'PAIS'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIR_COMPLETA_N'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO1'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERTENECE_CEE'
              Width = 35
              Visible = True
            end>
        end
        object TBIntraClientes: TLFToolBar
          Left = 0
          Top = 0
          Width = 1084
          Height = 29
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavIntraClientes: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMVerificacionesImpuestos.DSxClientesIntra
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton1: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object ToolButton3: TToolButton
            Left = 248
            Top = 2
            Action = ARefrescaIntraClientes
            ImageIndex = 26
          end
        end
      end
      object PNLIntraProveedores: TLFPanel
        Left = 0
        Top = 183
        Width = 1084
        Height = 151
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LIntraProveedores: TLFLabel
          Left = 0
          Top = 29
          Width = 1084
          Height = 13
          Align = alTop
          Caption = 
            'Proveedores cuyo Modo de IVA, pais y marca Intrastat no se corre' +
            'sponden'
          Color = clInfoBk
          ParentColor = False
        end
        object DBGIntraProveedores: THYTDBGrid
          Left = 0
          Top = 42
          Width = 1084
          Height = 109
          Align = alClient
          Color = clInfoBk
          DataSource = DMVerificacionesImpuestos.DSxProveedoresIntra
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGIntraProveedoresDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'DIR_COMPLETA_N'
            'INTRA'
            'MODO_IVA'
            'NOMBRE_R_SOCIAL'
            'PAIS'
            'PERTENECE_CEE'
            'PROVEEDOR'
            'TITULO'
            'TITULO1')
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 300
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'INTRA'
              Width = 35
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'MODO_IVA'
              Width = 55
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'PAIS'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIR_COMPLETA_N'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO1'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERTENECE_CEE'
              Width = 35
              Visible = True
            end>
        end
        object TBIntraProveedores: TLFToolBar
          Left = 0
          Top = 0
          Width = 1084
          Height = 29
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavIntraProveedores: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMVerificacionesImpuestos.DSxProveedoresIntra
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton2: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object ToolButton4: TToolButton
            Left = 248
            Top = 2
            Action = ARefrescaIntraProveedores
            ImageIndex = 26
          end
        end
      end
      object PNLIntraAcreedores: TLFPanel
        Left = 0
        Top = 341
        Width = 1084
        Height = 175
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object LIntraAcreedores: TLFLabel
          Left = 0
          Top = 29
          Width = 1084
          Height = 13
          Align = alTop
          Caption = 'Acreedores cuyo Modo de IVA y pais no se corresponden'
          Color = clInfoBk
          ParentColor = False
        end
        object DBGIntraAcreedores: THYTDBGrid
          Left = 0
          Top = 42
          Width = 1084
          Height = 133
          Align = alClient
          Color = clInfoBk
          DataSource = DMVerificacionesImpuestos.DSxAcreedoresIntra
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGIntraAcreedoresDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'DIR_COMPLETA_N'
            'INTRA'
            'MODO_IVA'
            'NOMBRE_R_SOCIAL'
            'PAIS'
            'PERTENECE_CEE'
            'PROVEEDOR'
            'TITULO'
            'TITULO1')
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'ACREEDOR'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 300
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'INTRA'
              Width = 35
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'MODO_IVA'
              Width = 55
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'PAIS'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIR_COMPLETA_N'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO1'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERTENECE_CEE'
              Width = 35
              Visible = True
            end>
        end
        object TBIntraAcreedores: TLFToolBar
          Left = 0
          Top = 0
          Width = 1084
          Height = 29
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavIntraAcreedores: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMVerificacionesImpuestos.DSxProveedoresIntra
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton15: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object ToolButton16: TToolButton
            Left = 248
            Top = 2
            Action = ARefrescaIntraAcreedores
            ImageIndex = 26
          end
        end
      end
    end
    object TSAutofacturas: TTabSheet
      Caption = 'Autofacturas'
      ImageIndex = 1
      object PNLAutofacturas: TLFPanel
        Left = 0
        Top = 0
        Width = 1084
        Height = 516
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object LAutofactura: TLFLabel
          Left = 0
          Top = 29
          Width = 329
          Height = 13
          Align = alTop
          Caption = 
            'Facturas de Proveedor y Acreedor cuya autofactura no fue generad' +
            'a.'
          Color = clInfoBk
          ParentColor = False
        end
        object DBGAutofactura: THYTDBGrid
          Left = 0
          Top = 42
          Width = 1084
          Height = 474
          Align = alClient
          Color = clInfoBk
          DataSource = DMVerificacionesImpuestos.DSxAutofactura
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGAutofacturaDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'DIR_COMPLETA_N'
            'INTRA'
            'MODO_IVA'
            'NOMBRE_R_SOCIAL'
            'PAIS'
            'PERTENECE_CEE'
            'TITULO'
            'TITULO1')
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'SERIE'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE_AUTOFACTURA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUTOFACTURA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROACR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Visible = True
            end>
        end
        object TBAutofactura: TLFToolBar
          Left = 0
          Top = 0
          Width = 1084
          Height = 29
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavAutofactura: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMVerificacionesImpuestos.DSxAutofactura
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton17: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TBRefrescaAutofactura: TToolButton
            Left = 248
            Top = 2
            Action = ARefrescaAutofactura
            ImageIndex = 26
          end
        end
      end
    end
    object TSFacturasModo: TTabSheet
      Caption = 'Facturas Modo incorrecto'
      ImageIndex = 2
      object Splitter2: TSplitter
        Left = 0
        Top = 161
        Width = 1084
        Height = 7
        Cursor = crVSplit
        Align = alTop
      end
      object Splitter3: TSplitter
        Left = 0
        Top = 305
        Width = 1084
        Height = 8
        Cursor = crVSplit
        Align = alBottom
      end
      object PNLModoIncorrectoCliente: TLFPanel
        Left = 0
        Top = 0
        Width = 1084
        Height = 161
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TBIntraClientesModoIncorrecto: TLFLabel
          Left = 0
          Top = 29
          Width = 291
          Height = 13
          Align = alTop
          Caption = 'Facturas cuyo modo de IVA no corresponde con el del cliente'
          Color = clInfoBk
          ParentColor = False
        end
        object DBGModoIncorrectoCliente: THYTDBGrid
          Left = 0
          Top = 42
          Width = 1084
          Height = 119
          Align = alClient
          Color = clInfoBk
          DataSource = DMVerificacionesImpuestos.DSxFACModoIncorrecto
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGModoIncorrectoClienteDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'FECHA'
            'MODO'
            'MODO_IVA'
            'NOMBRE_R_SOCIAL'
            'RIG'
            'RIG_VISIBLE'
            'S_BASES'
            'S_IVAS'
            'SERIE'
            'TIPO')
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'SERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_VISIBLE'
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'MODO'
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'MODO_IVA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'S_BASES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'S_IVAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 75
              Visible = True
            end>
        end
        object TBModoIncorrectoCliente: TLFToolBar
          Left = 0
          Top = 0
          Width = 1084
          Height = 29
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavModoIncorrectoCliente: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMVerificacionesImpuestos.DSxFACModoIncorrecto
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton5: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtModoIncorrectoRefrescaCliente: TToolButton
            Left = 248
            Top = 2
            Action = ARefrescaModoIncorrectoCliente
            ImageIndex = 26
          end
        end
      end
      object PNLModoIncorrectoProveedor: TLFPanel
        Left = 0
        Top = 168
        Width = 1084
        Height = 137
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LIntraProveedoresModoIncorrecto: TLFLabel
          Left = 0
          Top = 29
          Width = 308
          Height = 13
          Align = alTop
          Caption = 'Facturas cuyo modo de IVA no corresponde con el del proveedor'
          Color = clInfoBk
          ParentColor = False
        end
        object DBGModoIncorrectoProveedor: THYTDBGrid
          Left = 0
          Top = 42
          Width = 1084
          Height = 95
          Align = alClient
          Color = clInfoBk
          DataSource = DMVerificacionesImpuestos.DSxFAPModoIncorrecto
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGModoIncorrectoProveedorDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'FECHA'
            'MODO'
            'MODO_IVA'
            'NOMBRE_R_SOCIAL'
            'PROVEEDOR'
            'RIG'
            'RIG_VISIBLE'
            'S_BASES'
            'S_IVAS'
            'SERIE'
            'TIPO')
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'SERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_VISIBLE'
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'MODO'
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'MODO_IVA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'S_BASES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'S_IVAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 75
              Visible = True
            end>
        end
        object TBModoIncorrectoProveedor: TLFToolBar
          Left = 0
          Top = 0
          Width = 1084
          Height = 29
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavModoIncorrectoProveedor: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMVerificacionesImpuestos.DSxFAPModoIncorrecto
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton7: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtModoIncorrectoRefrescaProveedor: TToolButton
            Left = 248
            Top = 2
            Action = ARefrescaModoIncorrectoProveedor
            ImageIndex = 26
          end
        end
      end
      object PNLModoIncorrectoAcreedor: TLFPanel
        Left = 0
        Top = 313
        Width = 1084
        Height = 203
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object LIntraAcreedoresModoIncorrecto: TLFLabel
          Left = 0
          Top = 29
          Width = 302
          Height = 13
          Align = alTop
          Caption = 'Facturas cuyo modo de IVA no corresponde con el del acreedor'
          Color = clInfoBk
          ParentColor = False
        end
        object DBGModoIncorrectoAcreedor: THYTDBGrid
          Left = 0
          Top = 42
          Width = 1084
          Height = 161
          Align = alClient
          Color = clInfoBk
          DataSource = DMVerificacionesImpuestos.DSxFCRModoIndorrecto
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGModoIncorrectoAcreedorDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'ACREEDOR'
            'FECHA'
            'MODO'
            'MODO_IVA'
            'NOMBRE_R_SOCIAL'
            'RIG'
            'RIG_VISIBLE'
            'S_BASES'
            'S_IVAS'
            'SERIE'
            'TIPO')
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'SERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACREEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_VISIBLE'
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'MODO'
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'MODO_IVA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'S_BASES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'S_IVAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 75
              Visible = True
            end>
        end
        object TBModoIncorrectoAcreedor: TLFToolBar
          Left = 0
          Top = 0
          Width = 1084
          Height = 29
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavModoIncorrectoAcreedor: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMVerificacionesImpuestos.DSxFCRModoIndorrecto
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton9: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtModoIncorrectoRefrescaAcreedor: TToolButton
            Left = 248
            Top = 2
            Action = ARefrescaModoIncorrectoAcreedor
            ImageIndex = 26
          end
        end
      end
    end
    object TSCompMod349: TTabSheet
      Caption = 'Comp. Mod. 349'
      ImageIndex = 3
      object Splitter4: TSplitter
        Left = 355
        Top = 0
        Width = 8
        Height = 516
        Cursor = crHSplit
      end
      object Splitter5: TSplitter
        Left = 721
        Top = 0
        Width = 8
        Height = 516
        Cursor = crHSplit
        Align = alRight
      end
      object PNLMod349Pais: TLFPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 516
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LMod349Pais: TLFLabel
          Left = 0
          Top = 29
          Width = 243
          Height = 13
          Align = alTop
          Caption = 'Registro del Cli./Pro./Acr. con pa'#237's intracomunitario'
          Color = clInfoBk
          ParentColor = False
        end
        object TBMod349Pais: TLFToolBar
          Left = 0
          Top = 0
          Width = 355
          Height = 29
          ButtonWidth = 24
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavMod349Pais: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMVerificacionesImpuestos.DSxMod349Pais
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton6: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtRefrescaMod349Pais: TToolButton
            Left = 248
            Top = 2
            Action = ARefrescaMod349Pais
            ImageIndex = 26
          end
          object ToolButton12: TToolButton
            Left = 272
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtSiguienteErrorPais: TButton
            Left = 280
            Top = 2
            Width = 25
            Height = 22
            Action = ASiguienteErrorPais
            TabOrder = 1
          end
          object TButtAnteriorErrorPais: TButton
            Left = 305
            Top = 2
            Width = 25
            Height = 22
            Action = AAnteriorErrorPais
            TabOrder = 2
          end
        end
        object DGBMod349Pais: THYTDBGrid
          Left = 0
          Top = 42
          Width = 355
          Height = 474
          Align = alClient
          Color = clInfoBk
          DataSource = DMVerificacionesImpuestos.DSxMod349Pais
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DGBMod349PaisDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'B_IMPONIBLE'
            'DOC_FECHA'
            'DOC_NUMERO'
            'DOC_SERIE'
            'FECHA_REGISTRO'
            'I_IVA'
            'PAIS'
            'TIPO_DOC')
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'SIGNO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_VISIBLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_DOC'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_SERIE'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NUMERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_FECHA'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REGISTRO'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'B_IMPONIBLE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'I_IVA'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS'
              Width = 30
              Visible = True
            end>
        end
      end
      object PNLMod349ModoIVA: TLFPanel
        Left = 363
        Top = 0
        Width = 358
        Height = 516
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LMod349ModoIVA: TLFLabel
          Left = 0
          Top = 29
          Width = 284
          Height = 13
          Align = alTop
          Caption = 'Registro del Cli./Pro./Acr. con Modo de IVA intracomunitario'
          Color = clInfoBk
          ParentColor = False
        end
        object TBMod349ModoIVA: TLFToolBar
          Left = 0
          Top = 0
          Width = 358
          Height = 29
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavMod349ModoIVA: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMVerificacionesImpuestos.DSxMod349Modo
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton8: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtRefrescaMod349Modo: TToolButton
            Left = 248
            Top = 2
            Action = ARefrescaMod349Modo
            ImageIndex = 26
          end
          object ToolButton13: TToolButton
            Left = 271
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtSiguienteErrorModo: TButton
            Left = 279
            Top = 2
            Width = 25
            Height = 22
            Action = ASiguienteErrorModo
            TabOrder = 1
          end
          object TButtAnteriorErrorModo: TButton
            Left = 304
            Top = 2
            Width = 25
            Height = 22
            Action = AAnteriorErrorModo
            TabOrder = 2
          end
        end
        object DGBMod349ModoIVA: THYTDBGrid
          Left = 0
          Top = 42
          Width = 358
          Height = 474
          Align = alClient
          Color = clInfoBk
          DataSource = DMVerificacionesImpuestos.DSxMod349Modo
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DGBMod349ModoIVADblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'B_IMPONIBLE'
            'DOC_FECHA'
            'DOC_NUMERO'
            'DOC_SERIE'
            'FECHA_REGISTRO'
            'I_IVA'
            'PAIS'
            'TIPO_DOC')
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'SIGNO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_VISIBLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_DOC'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_SERIE'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NUMERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_FECHA'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REGISTRO'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'B_IMPONIBLE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'I_IVA'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS'
              Width = 30
              Visible = True
            end>
        end
      end
      object PNLMod349: TLFPanel
        Left = 729
        Top = 0
        Width = 355
        Height = 516
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        object LMod349: TLFLabel
          Left = 0
          Top = 29
          Width = 275
          Height = 13
          Align = alTop
          Caption = 'Registro del Cli./Pro./Acr. que aparecen en el Modelo 349'
          Color = clInfoBk
          ParentColor = False
        end
        object TBMod349: TLFToolBar
          Left = 0
          Top = 0
          Width = 355
          Height = 29
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavMod349: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMVerificacionesImpuestos.DSxMod349
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton10: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtRefrescaMod349: TToolButton
            Left = 248
            Top = 2
            Action = ARefrescaMod349
            ImageIndex = 26
          end
          object ToolButton14: TToolButton
            Left = 271
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtSiguienteErrorModelo: TButton
            Left = 279
            Top = 2
            Width = 25
            Height = 22
            Action = ASiguienteErrorModelo
            TabOrder = 1
          end
          object TButtAnteriorErrorModelo: TButton
            Left = 304
            Top = 2
            Width = 25
            Height = 22
            Action = AAnteriorErrorModelo
            TabOrder = 2
          end
        end
        object DBGMod349: THYTDBGrid
          Left = 0
          Top = 42
          Width = 355
          Height = 474
          Align = alClient
          Color = clInfoBk
          DataSource = DMVerificacionesImpuestos.DSxMod349
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGMod349DblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAMarcar.Strings = (
            'ACTIVO'
            'DEDUCIBLE'
            'PERTENECE_CEE')
          CamposChecked.Strings = (
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'B_IMPONIBLE'
            'CIF'
            'CUENTA'
            'CUENTA_IVA'
            'DEDUCIBLE'
            'DESCRIPCION_CTA'
            'DOC_FECHA'
            'DOC_NUMERO'
            'DOC_SERIE'
            'FECHA_REGISTRO'
            'I_IVA'
            'I_REC'
            'LIQUIDO_TOTAL'
            'MODO'
            'NUM_FACTURA'
            'P_IVA'
            'P_REC'
            'PAIS'
            'PERTENECE_CEE'
            'REGISTRO'
            'RIC'
            'RIG_VISIBLE'
            'TIPO_DOC'
            'TIPO_IVA'
            'TITULO')
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'SIGNO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_VISIBLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_DOC'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_SERIE'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NUMERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_FECHA'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REGISTRO'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'B_IMPONIBLE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS'
              Width = 30
              Visible = True
            end>
        end
      end
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 1092
    Height = 29
    ButtonHeight = 25
    ButtonWidth = 25
    EdgeInner = esNone
    EdgeOuter = esNone
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object PNLFechas: TLFPanel
      Left = 0
      Top = 2
      Width = 361
      Height = 25
      BevelOuter = bvNone
      TabOrder = 0
      object LDesde: TLFLabel
        Left = 29
        Top = 5
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHasta: TLFLabel
        Left = 205
        Top = 6
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DEDesdeFecha: TLFDateEdit
        Left = 64
        Top = 2
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
        OnChange = DEDesdeFechaChange
      end
      object DEHastaFecha: TLFDateEdit
        Left = 237
        Top = 2
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
        OnChange = DEHastaFechaChange
      end
    end
    object ToolButton11: TToolButton
      Left = 361
      Top = 2
      Width = 8
      Style = tbsSeparator
    end
    object TButtAFiltrarFechas: TToolButton
      Left = 369
      Top = 2
      Action = AFiltrarFechas
      ImageIndex = 5
    end
  end
  object ALMain: TActionList
    Left = 960
    Top = 24
    object ARefrescaIntraClientes: TAction
      Caption = 'Refresca datos Clientes'
      Hint = 'Refresca datos Clientes'
      ImageIndex = 39
      OnExecute = ARefrescaIntraClientesExecute
    end
    object ARefrescaIntraProveedores: TAction
      Caption = 'Refresca datos Proveedores'
      Hint = 'Refresca datos Proveedores'
      ImageIndex = 39
      OnExecute = ARefrescaIntraProveedoresExecute
    end
    object ARefrescaModoIncorrectoCliente: TAction
      Caption = 'Refresca Datos Cliente'
      Hint = 'Refresca Datos Cliente'
      ImageIndex = 39
      OnExecute = ARefrescaModoIncorrectoClienteExecute
    end
    object ARefrescaModoIncorrectoProveedor: TAction
      Caption = 'Refresca Datos Proveedor'
      Hint = 'Refresca Datos Proveedor'
      ImageIndex = 39
      OnExecute = ARefrescaModoIncorrectoProveedorExecute
    end
    object ARefrescaModoIncorrectoAcreedor: TAction
      Caption = 'Refresca Datos Acreedor'
      Hint = 'Refresca Datos Acreedor'
      ImageIndex = 39
      OnExecute = ARefrescaModoIncorrectoAcreedorExecute
    end
    object ARefrescaMod349Pais: TAction
      Caption = 'Refresca Mod. 349 Pais'
      Hint = 'Refresca Mod. 349 Pais'
      ImageIndex = 39
    end
    object ARefrescaMod349Modo: TAction
      Caption = 'Refresca Mod. 349 Modo'
      Hint = 'Refresca Mod. 349 Modo'
      ImageIndex = 39
    end
    object ARefrescaMod349: TAction
      Caption = 'Refresca Mod. 349'
      Hint = 'Refresca Mod. 349'
      ImageIndex = 39
    end
    object AFiltrarFechas: TAction
      Caption = 'Filtrar por Fechas'
      Hint = 'Filtrar por Fechas'
      ImageIndex = 39
      OnExecute = AFiltrarFechasExecute
    end
    object ASiguienteErrorPais: TAction
      Caption = 'Sig.'
      Hint = 'Busca el siguiente error'
      OnExecute = ASiguienteErrorPaisExecute
    end
    object AAnteriorErrorPais: TAction
      Caption = 'Ant.'
      Hint = 'Busca el error anterior'
      OnExecute = AAnteriorErrorPaisExecute
    end
    object ASiguienteErrorModo: TAction
      Caption = 'Sig.'
      Hint = 'Busca el siguiente error'
      OnExecute = ASiguienteErrorModoExecute
    end
    object AAnteriorErrorModo: TAction
      Caption = 'Ant.'
      Hint = 'Busca el error anterior'
      OnExecute = AAnteriorErrorModoExecute
    end
    object ASiguienteErrorModelo: TAction
      Caption = 'Sig.'
      Hint = 'Busca el siguiente error'
      OnExecute = ASiguienteErrorModeloExecute
    end
    object AAnteriorErrorModelo: TAction
      Caption = 'Ant.'
      Hint = 'Busca el error anterior'
      OnExecute = AAnteriorErrorModeloExecute
    end
    object ARefrescaIntraAcreedores: TAction
      Caption = 'Refresca datos Acreedores'
      Hint = 'Refresca datos Acreedores'
      ImageIndex = 39
      OnExecute = ARefrescaIntraAcreedoresExecute
    end
    object ARefrescaAutofactura: TAction
      Caption = 'Refresca datos Autofactura'
      Hint = 'Refresca datos Autofactura'
      ImageIndex = 39
      OnExecute = ARefrescaAutofacturaExecute
    end
  end
end
