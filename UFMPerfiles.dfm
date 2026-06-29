inherited FMPerfiles: TFMPerfiles
  Left = 553
  Top = 207
  HelpContext = 310
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Perfiles'
  ClientHeight = 476
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 452
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMPerfiles.DSPerfiles
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEPerfil
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Height = 422
      MultiLine = True
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 394
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMPerfiles.DSPerfiles
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_PERFILES'
            CampoNum = 'PERFIL'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'PERFIL')
          end
          object LPerfil: TLFLabel
            Left = 50
            Top = 44
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Perfil'
            FocusControl = DBEPerfil
          end
          object LTitulo: TLFLabel
            Left = 45
            Top = 66
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEPerfil: TLFDbedit
            Left = 79
            Top = 41
            Width = 48
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PERFIL'
            DataSource = DMPerfiles.DSPerfiles
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 79
            Top = 63
            Width = 297
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPerfiles.DSPerfiles
            TabOrder = 2
          end
          object DBCBDefecto: TLFDBCheckBox
            Left = 135
            Top = 43
            Width = 62
            Height = 17
            Caption = '&Defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = DMPerfiles.DSPerfiles
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GBFormularios: TGroupBox
            Left = 0
            Top = 108
            Width = 490
            Height = 286
            Align = alBottom
            Anchors = [akLeft, akTop, akRight, akBottom]
            Caption = '&Formularios'
            TabOrder = 3
            object LOferta: TLFLabel
              Left = 54
              Top = 34
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'Oferta'
            end
            object LPedido: TLFLabel
              Left = 50
              Top = 65
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pedido'
            end
            object LAlbaran: TLFLabel
              Left = 47
              Top = 95
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Albar'#225'n'
            end
            object LFactura: TLFLabel
              Left = 47
              Top = 125
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Factura'
            end
            object LNroListado: TLFLabel
              Left = 90
              Top = 14
              Width = 48
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'N'#186
            end
            object LNombreFormulario: TLFLabel
              Left = 139
              Top = 14
              Width = 170
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Nombre del formulario'
            end
            object LNroCopias: TLFLabel
              Left = 308
              Top = 12
              Width = 73
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'N'#186' de copias'
            end
            object LFLabel1: TLFLabel
              Left = 20
              Top = 162
              Width = 63
              Height = 13
              Alignment = taRightJustify
              Caption = 'Oferta Correo'
            end
            object LFLabel2: TLFLabel
              Left = 16
              Top = 193
              Width = 67
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pedido Correo'
            end
            object LFLabel3: TLFLabel
              Left = 13
              Top = 223
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Albar'#225'n Correo'
            end
            object LFLabel4: TLFLabel
              Left = 13
              Top = 253
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Factura Correo'
            end
            object EFOferta: TLFDBEditFind2000
              Left = 89
              Top = 30
              Width = 48
              Height = 21
              DataField = 'MODELO_OFERTA'
              DataSource = DMPerfiles.DSPerfiles
              TabOrder = 0
              OnChange = EFOfertaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'DIC_LISTADOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'LISTADO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'grupo=38'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'LISTADO')
              Filtros = []
            end
            object ETituloOferta: TLFEdit
              Left = 138
              Top = 30
              Width = 170
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBSECopiasOfertas: TDBSpinEdit
              Left = 309
              Top = 30
              Width = 73
              Height = 22
              Hint = 'Copias de Oferta'
              MaxValue = 0
              MinValue = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              Value = 0
              DataField = 'COPIAS_OFERTA'
              DataSource = DMPerfiles.DSPerfiles
            end
            object EFPedido: TLFDBEditFind2000
              Left = 89
              Top = 61
              Width = 48
              Height = 21
              DataField = 'MODELO_PEDIDO'
              DataSource = DMPerfiles.DSPerfiles
              TabOrder = 5
              OnChange = EFPedidoChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'DIC_LISTADOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'LISTADO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'grupo=39'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'LISTADO')
              Filtros = []
            end
            object ETituloPedido: TLFEdit
              Left = 138
              Top = 61
              Width = 170
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object DBSECopiasPedido: TDBSpinEdit
              Left = 309
              Top = 61
              Width = 73
              Height = 22
              Hint = 'Copias de Pedido'
              MaxValue = 0
              MinValue = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              Value = 0
              DataField = 'COPIAS_PEDIDO'
              DataSource = DMPerfiles.DSPerfiles
            end
            object EFAlbaran: TLFDBEditFind2000
              Left = 89
              Top = 91
              Width = 48
              Height = 21
              DataField = 'MODELO_ALBARAN'
              DataSource = DMPerfiles.DSPerfiles
              TabOrder = 10
              OnChange = EFAlbaranChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'DIC_LISTADOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'LISTADO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'grupo=34'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'LISTADO')
              Filtros = []
            end
            object ETituloAlbaran: TLFEdit
              Left = 138
              Top = 91
              Width = 170
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
            end
            object DBSECopiasAlbaran: TDBSpinEdit
              Left = 309
              Top = 91
              Width = 73
              Height = 22
              Hint = 'Copias de Albaran'
              MaxValue = 0
              MinValue = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 12
              Value = 0
              DataField = 'COPIAS_ALBARAN'
              DataSource = DMPerfiles.DSPerfiles
            end
            object EFFactura: TLFDBEditFind2000
              Left = 89
              Top = 121
              Width = 48
              Height = 21
              DataField = 'MODELO_FACTURA'
              DataSource = DMPerfiles.DSPerfiles
              TabOrder = 15
              OnChange = EFFacturaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'DIC_LISTADOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'LISTADO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'grupo=36'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'LISTADO')
              Filtros = []
            end
            object ETituloFactura: TLFEdit
              Left = 138
              Top = 121
              Width = 170
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 16
            end
            object DBSECopiasFactura: TDBSpinEdit
              Left = 309
              Top = 121
              Width = 73
              Height = 22
              Hint = 'Copias de Factura'
              MaxValue = 0
              MinValue = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 17
              Value = 0
              DataField = 'COPIAS_FACTURA'
              DataSource = DMPerfiles.DSPerfiles
            end
            object DBCBImponerListadosOferta: TLFDBCheckBox
              Left = 385
              Top = 25
              Width = 100
              Height = 17
              Caption = 'Imponer listados'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_LISTADO_OFERTA'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBImponerCopiasOferta: TLFDBCheckBox
              Left = 385
              Top = 40
              Width = 100
              Height = 17
              Caption = 'Imponer copias'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_COPIAS_OFERTA'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBImponerListadosPedido: TLFDBCheckBox
              Left = 385
              Top = 56
              Width = 100
              Height = 17
              Caption = 'Imponer listados'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 8
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_LISTADO_PEDIDO'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBImponerCopiasPedido: TLFDBCheckBox
              Left = 385
              Top = 71
              Width = 100
              Height = 17
              Caption = 'Imponer copias'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 9
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_COPIAS_PEDIDO'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBImponerListadosAlbaran: TLFDBCheckBox
              Left = 385
              Top = 87
              Width = 100
              Height = 17
              Caption = 'Imponer listados'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 13
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_LISTADO_ALBARAN'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBImponerCopiasAlbaran: TLFDBCheckBox
              Left = 385
              Top = 102
              Width = 100
              Height = 17
              Caption = 'Imponer copias'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 14
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_COPIAS_ALBARAN'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBImponerListadosFactura: TLFDBCheckBox
              Left = 385
              Top = 117
              Width = 100
              Height = 17
              Caption = 'Imponer listados'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 18
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_LISTADO_FACTURA'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBImponerCopiasFacturas: TLFDBCheckBox
              Left = 385
              Top = 132
              Width = 100
              Height = 17
              Caption = 'Imponer copias'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 19
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_COPIAS_FACTURA'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object EFOfertaMail: TLFDBEditFind2000
              Left = 89
              Top = 158
              Width = 48
              Height = 21
              DataField = 'MODELO_OFERTA_MAIL'
              DataSource = DMPerfiles.DSPerfiles
              TabOrder = 20
              OnChange = EFOfertaMailChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'DIC_LISTADOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'LISTADO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'grupo=38'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'LISTADO')
              Filtros = []
            end
            object ETituloOfertaMail: TLFEdit
              Left = 138
              Top = 158
              Width = 243
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 21
            end
            object EFPedidoMail: TLFDBEditFind2000
              Left = 89
              Top = 189
              Width = 48
              Height = 21
              DataField = 'MODELO_PEDIDO_MAIL'
              DataSource = DMPerfiles.DSPerfiles
              TabOrder = 23
              OnChange = EFPedidoMailChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'DIC_LISTADOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'LISTADO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'grupo=39'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'LISTADO')
              Filtros = []
            end
            object ETituloPedidoMail: TLFEdit
              Left = 138
              Top = 189
              Width = 243
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 24
            end
            object EFAlbaranMail: TLFDBEditFind2000
              Left = 89
              Top = 219
              Width = 48
              Height = 21
              DataField = 'MODELO_ALBARAN_MAIL'
              DataSource = DMPerfiles.DSPerfiles
              TabOrder = 26
              OnChange = EFAlbaranMailChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'DIC_LISTADOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'LISTADO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'grupo=34'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'LISTADO')
              Filtros = []
            end
            object ETituloAlbaranMail: TLFEdit
              Left = 138
              Top = 219
              Width = 243
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 27
            end
            object EFFacturaMail: TLFDBEditFind2000
              Left = 89
              Top = 249
              Width = 48
              Height = 21
              DataField = 'MODELO_FACTURA_MAIL'
              DataSource = DMPerfiles.DSPerfiles
              TabOrder = 29
              OnChange = EFFacturaMailChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'DIC_LISTADOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'LISTADO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'grupo=36'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'LISTADO')
              Filtros = []
            end
            object ETituloFacturaMail: TLFEdit
              Left = 138
              Top = 249
              Width = 243
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 30
            end
            object DBCBImponerListadosOfertaMail: TLFDBCheckBox
              Left = 385
              Top = 161
              Width = 100
              Height = 17
              Caption = 'Imponer listados'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 22
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_LISTADO_OFERTA_MAIL'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBImponerListadosPedidoMail: TLFDBCheckBox
              Left = 385
              Top = 190
              Width = 100
              Height = 17
              Caption = 'Imponer listados'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 25
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_LISTADO_PEDIDO_MAIL'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBImponerListadosAlbaranMail: TLFDBCheckBox
              Left = 385
              Top = 221
              Width = 100
              Height = 17
              Caption = 'Imponer listados'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 28
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_LISTADO_ALBARAN_MAIL'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBImponerListadosFacturaMail: TLFDBCheckBox
              Left = 385
              Top = 251
              Width = 100
              Height = 17
              Caption = 'Imponer listados'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 31
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPONER_LISTADO_FACTURA_MAIL'
              DataSource = DMPerfiles.DSPerfiles
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 394
          DataSource = DMPerfiles.DSPerfiles
          CamposAMarcar.Strings = (
            'DEFECTO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'PERFIL'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PERFIL'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 342
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              Width = 51
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 452
  end
  inherited CEMain: TControlEdit
    Left = 284
    Top = 64
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 348
    Top = 64
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 402
    Top = 76
  end
end
