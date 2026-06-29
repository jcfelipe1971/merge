inherited ZFMTroqueles: TZFMTroqueles
  Left = 327
  Top = 244
  Width = 871
  Height = 490
  Hint = 'Mantenimiento del maestro de troqueles'
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Troqueles'
  PopupMenu = CEImagenesPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 861
    Height = 437
    inherited TBMain: TLFToolBar
      Width = 857
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEAncho
        InsertaControl = DBETroquel
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object TSep1: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBPdf: TToolButton
        Left = 347
        Top = 0
        Hint = 'Abrir PDF'
        Caption = 'TBPdf'
        ImageIndex = 61
        OnClick = TBPdfClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 857
      Height = 407
      inherited TSFicha: TTabSheet
        object SBAFiltraUtillaje: TSpeedButton [0]
          Left = 385
          Top = 135
          Width = 153
          Height = 20
          Hint = 'Muestra las fichas de los art'#237'culos pertenecientes a este modelo'
          GroupIndex = -1
          Caption = 'Filtra Utillaje'
          OnDblClick = SBAFiltraUtillajeDblClick
        end
        object SBAFiltraArticulo: TSpeedButton [1]
          Left = 385
          Top = 135
          Width = 153
          Height = 20
          Hint = 'Muestra las fichas de los art'#237'culos pertenecientes a este modelo'
          GroupIndex = -1
          Caption = 'Filtra Utillaje'
          OnDblClick = SBAFiltraArticuloDblClick
        end
        inherited PEdit: TLFPanel
          Width = 849
          Height = 379
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'AVANCE')
            DataSource = ZDMTroqueles.DSQMTroqueles
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_TROQUELES'
            CampoNum = 'TROQUEL'
            CampoStr = 'ANCHO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TROQUEL')
          end
          object LblTroquel: TLFLabel
            Left = 57
            Top = 27
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Troquel'
            FocusControl = DBETroquel
          end
          object LblAncho: TLFLabel
            Left = 62
            Top = 49
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho'
            FocusControl = DBEAncho
          end
          object LblAvance: TLFLabel
            Left = 57
            Top = 70
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Avance'
            FocusControl = DBEAvance
          end
          object LNotas: TLFLabel
            Left = 65
            Top = 217
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LF_Z: TLFLabel
            Left = 213
            Top = 92
            Width = 7
            Height = 13
            Alignment = taRightJustify
            Caption = 'Z'
          end
          object LFSVAvance: TLFLabel
            Left = 173
            Top = 70
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'S. Avance'
            FocusControl = DBESHAvance
          end
          object LFSHAvance: TLFLabel
            Left = 176
            Top = 49
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'S. Ancho'
            FocusControl = DBESHAncho
          end
          object LFFigurasAncho: TLFLabel
            Left = 312
            Top = 49
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Figuras Ancho'
            FocusControl = DBESH_ANCHO
          end
          object LFFigurasAvance: TLFLabel
            Left = 308
            Top = 70
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Figuras Avance'
            FocusControl = DBESV_AVANCE
          end
          object LFBanda: TLFLabel
            Left = 62
            Top = 91
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banda'
            FocusControl = DBEBanda
          end
          object LblMaquina: TLFLabel
            Left = 53
            Top = 122
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'quina'
            FocusControl = DBEFMaquina
          end
          object LFForma: TLFLabel
            Left = 65
            Top = 144
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma'
            FocusControl = DBEFForma
          end
          object LFArticulo: TLFLabel
            Left = 57
            Top = 165
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
            FocusControl = DBEFArticulo
          end
          object LFUtillaje: TLFLabel
            Left = 63
            Top = 186
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Utillaje'
            FocusControl = DBEFUtillaje
          end
          object LFImagen: TLFLabel
            Left = 488
            Top = 26
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object DBETroquel: TLFDbedit
            Left = 98
            Top = 23
            Width = 42
            Height = 21
            Color = clInfoBk
            DataField = 'TROQUEL'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 0
          end
          object DBEAncho: TLFDbedit
            Left = 98
            Top = 45
            Width = 71
            Height = 21
            DataField = 'ANCHO'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 4
          end
          object DBEAvance: TLFDbedit
            Left = 98
            Top = 66
            Width = 71
            Height = 21
            DataField = 'AVANCE'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 7
          end
          object DBMMNotas: TLFDBMemo
            Left = 98
            Top = 215
            Width = 364
            Height = 129
            DataField = 'OBSERVACIONES'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 16
          end
          object DBEPos_Z: TLFDbedit
            Left = 227
            Top = 88
            Width = 71
            Height = 21
            DataField = 'POS_Z'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 11
          end
          object LFCBTroquelEsp: TLFDBCheckBox
            Left = 150
            Top = 25
            Width = 101
            Height = 17
            Caption = 'Troquel Especial'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TROQUEL_ESPECIAL'
            DataSource = ZDMTroqueles.DSQMTroqueles
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBOvalado: TLFDBCheckBox
            Left = 268
            Top = 24
            Width = 121
            Height = 17
            Caption = 'Troquel Ovalado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TROQUEL_OVALADO'
            DataSource = ZDMTroqueles.DSQMTroqueles
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBESHAvance: TLFDbedit
            Left = 227
            Top = 66
            Width = 71
            Height = 21
            DataField = 'SV_AVANCE'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 8
          end
          object DBESHAncho: TLFDbedit
            Left = 227
            Top = 45
            Width = 71
            Height = 21
            DataField = 'SH_ANCHO'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 5
          end
          object DBESH_ANCHO: TLFDbedit
            Left = 387
            Top = 45
            Width = 71
            Height = 21
            DataField = 'FIGURAS_ANCHO'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 6
          end
          object DBESV_AVANCE: TLFDbedit
            Left = 387
            Top = 66
            Width = 71
            Height = 21
            DataField = 'FIGURAS_AVANCE'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 9
          end
          object DBEBanda: TLFDbedit
            Left = 98
            Top = 87
            Width = 71
            Height = 21
            DataField = 'BANDA'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 10
          end
          object DBEFMaquina: TLFDBEditFind2000
            Left = 98
            Top = 118
            Width = 122
            Height = 21
            DataField = 'MAQUINA'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 12
            OnChange = DBEFMaquinaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescripcionMaquina: TLFEdit
            Left = 222
            Top = 118
            Width = 239
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 22
          end
          object DBEFForma: TLFDBEditFind2000
            Left = 98
            Top = 140
            Width = 122
            Height = 21
            DataField = 'FORMA'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 13
            OnChange = DBEFFormaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'TIPO_AUX='#39'FOR'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object EDescripcionForma: TLFEdit
            Left = 222
            Top = 140
            Width = 239
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 23
          end
          object LFDBTrepado: TLFDBCheckBox
            Left = 380
            Top = 24
            Width = 85
            Height = 17
            Caption = 'Trepado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TREPADO'
            DataSource = ZDMTroqueles.DSQMTroqueles
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFArticulo: TLFDBEditFind2000
            Left = 98
            Top = 161
            Width = 122
            Height = 21
            DataField = 'ARTICULO'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 14
            OnChange = DBEFArticuloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescripcionArticulo: TLFEdit
            Left = 222
            Top = 161
            Width = 239
            Height = 21
            TabStop = False
            Color = clAqua
            Enabled = False
            ReadOnly = True
            TabOrder = 24
          end
          object DBEFUtillaje: TLFDBEditFind2000
            Left = 98
            Top = 182
            Width = 122
            Height = 21
            DataField = 'UTILLAJE'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 15
            OnChange = DBEFUtillajeChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_SYS_UTILLAJES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescripcionUtillaje: TLFEdit
            Left = 222
            Top = 182
            Width = 239
            Height = 21
            TabStop = False
            Color = clAqua
            Enabled = False
            ReadOnly = True
            TabOrder = 25
          end
          object SBImagen: TScrollBox
            Left = 528
            Top = 54
            Width = 313
            Height = 323
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelInner = bvNone
            BevelOuter = bvNone
            TabOrder = 21
            object Imagen: TImage
              Left = 0
              Top = 0
              Width = 309
              Height = 319
              Align = alClient
              Proportional = True
              Stretch = True
            end
          end
          object DBEFImagen: TLFFibDBEditFind
            Left = 528
            Top = 23
            Width = 50
            Height = 21
            DataField = 'ID_IMAGEN'
            DataSource = ZDMTroqueles.DSQMTroqueles
            TabOrder = 17
            OnChange = DBEFImagenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IMAGENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object ETituloImagen: TLFEdit
            Left = 579
            Top = 23
            Width = 217
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
          end
          object BCargarImagen: TButton
            Left = 748
            Top = 25
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 19
            Visible = False
            OnClick = BCargarImagenClick
          end
          object BClipboard: TButton
            Left = 771
            Top = 25
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 20
            Visible = False
            OnClick = BClipboardClick
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 849
          Height = 379
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'ANCHO'
            'AVANCE'
            'CILINDRO'
            'POS_ANCHO'
            'POS_AVANCE'
            'TROQUEL')
          Columns = <
            item
              Expanded = False
              FieldName = 'TROQUEL'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANCHO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AVANCE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POS_ANCHO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POS_AVANCE'
              Width = 60
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 437
    Width = 861
    ButtonWidth = 23
  end
  inherited CEMain: TControlEdit
    Left = 292
    Top = 28
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 328
    Top = 27
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 435
    Top = 27
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ALstTroqueles: TAction
      Category = 'Listados'
      Caption = 'Lst Troqueles'
      ImageIndex = 14
      OnExecute = ATroquelesExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 399
    Top = 27
  end
  object CEImagenes: TControlEdit
    PopUpMenu = CEImagenesPMEdit
    Teclas = DMMain.Teclas
    Left = 260
    Top = 28
  end
  object CEImagenesPMEdit: TPopUpTeclas
    Left = 364
    Top = 27
    object CEImagenesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEImagenesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEImagenesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEImagenesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEImagenesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEImagenesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEImagenesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImagenesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImagenesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImagenesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
