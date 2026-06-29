inherited ZFMFichaTecArt: TZFMFichaTecArt
  Left = 554
  Top = 135
  Width = 832
  Height = 774
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Ficha T'#233'cnica de Art'#237'culos'
  PopupMenu = CEDibujoPMEdit
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 822
    Height = 721
    inherited TBMain: TLFToolBar
      Width = 818
      inherited NavMain: THYMNavigator
        Width = 160
        DataSource = ZDMFichaTecArt.DSQMFichaTecArt
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 160
      end
      inherited EPMain: THYMEditPanel
        Left = 168
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 248
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Left = 256
        Hint = 'Informacion Tercero'
        Caption = 'Informacion Tercero'
        Visible = True
        OnClick = TbuttCompClick
      end
      object TBDuplicar: TToolButton
        Left = 279
        Top = 0
        Hint = 'Duplicar art'#237'culo actual'
        Caption = 'TBDuplicar'
        ImageIndex = 37
        OnClick = TBDuplicarClick
      end
      object TbuttArticulo: TToolButton
        Left = 302
        Top = 0
        Hint = 'Abrir art'#237'culo actual'
        Caption = 'Enlace Articulos'
        ImageIndex = 109
        OnClick = TbuttArticuloClick
      end
      object TBAbrirPDF: TToolButton
        Left = 325
        Top = 0
        Hint = 'Abrir documento pdf'
        Caption = 'Abrir PDF'
        ImageIndex = 65
        OnClick = TBAbrirPDFClick
      end
      object PDuplicar: TLFPanel
        Left = 348
        Top = 0
        Width = 278
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
        object SBDuplicar: TSpeedButton
          Left = 252
          Top = 0
          Width = 23
          Height = 22
          Hint = 'Duplicar art'#237'culo actual'
          Flat = True
          OnClick = SBDuplicarClick
        end
        object LCodNuevoArticulo: TLFLabel
          Left = 8
          Top = 5
          Width = 97
          Height = 13
          Alignment = taRightJustify
          Caption = 'C'#243'd. Nuevo Art'#237'culo'
        end
        object EArtNuevo: TLFEdit
          Left = 108
          Top = 0
          Width = 141
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 818
      Height = 691
      inherited TSFicha: TTabSheet
        object SBAFiltraArticulo: TSpeedButton [0]
          Left = 385
          Top = 135
          Width = 153
          Height = 20
          Hint = 'Muestra las fichas de los art'#237'culos pertenecientes a este modelo'
          GroupIndex = -1
          Caption = 'Filtra Articulo'
          OnDblClick = SBAFiltraArticuloDblClick
        end
        object SBAFiltraEscandallo: TSpeedButton [1]
          Left = 393
          Top = 143
          Width = 153
          Height = 20
          Hint = 'Muestra las fichas de los art'#237'culos pertenecientes a este modelo'
          GroupIndex = -1
          Caption = 'Filtra Escandallo'
          OnDblClick = SBAFiltraEscandalloDblClick
        end
        inherited PEdit: TLFPanel
          Width = 810
          Height = 302
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Top = 41
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_ART_ARTICULOS_FICHA_TECNICA'
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO_ARTICULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
          end
          object LAvance: TLFLabel
            Left = 350
            Top = 151
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Avance'
          end
          object LblEtiquetas_por_rollo: TLFLabel
            Left = 11
            Top = 74
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Etiquetas x rollo'
            FocusControl = DBEEtiquetas_por_rollo
          end
          object LblDiametroInterior: TLFLabel
            Left = 363
            Top = 52
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Di'#225'metro interior'
            FocusControl = DBEDiametro_Interior
          end
          object LblDiametro_Exterior: TLFLabel
            Left = 515
            Top = 52
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Di'#225'metro exterior'
            FocusControl = DBEDiametro_Exterior
          end
          object LblEtiquetas_al_ancho: TLFLabel
            Left = 196
            Top = 73
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Etiquetas al ancho'
            FocusControl = DBEEtiquetas_al_ancho
          end
          object LAncho: TLFLabel
            Left = 142
            Top = 151
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho'
          end
          object LblTroquel: TLFLabel
            Left = 49
            Top = 152
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Troquel'
            FocusControl = DBEFTroqueles
          end
          object LArticulo: TLFLabel
            Left = 47
            Top = 8
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
            FocusControl = DBEArticulo
          end
          object LDescripcionArticulo: TLFLabel
            Left = 46
            Top = 29
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descrip.'
          end
          object LFotograbado: TLFLabel
            Left = 379
            Top = 96
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fotograbado'
            FocusControl = DBEFotograbado
          end
          object LObservacionesEtiqueta: TLFLabel
            Left = 21
            Top = 204
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Obs. Etiqueta'
          end
          object LEtiqxCaja: TLFLabel
            Left = 376
            Top = 74
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Etiq. por Caja'
            FocusControl = DBEEtiqetasPorCaja
          end
          object LFotograbadoEst: TLFLabel
            Left = 562
            Top = 96
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fotograbado Est.'
          end
          object LFechaWeb: TLFLabel
            Left = 28
            Top = 120
            Width = 56
            Height = 13
            Caption = 'Fecha Web'
          end
          object LSHAncho: TLFLabel
            Left = 240
            Top = 150
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'S. Ancho'
          end
          object LSVAvance: TLFLabel
            Left = 450
            Top = 151
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'S. Avance'
          end
          object LFLabel6: TLFLabel
            Left = 49
            Top = 174
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Troquel'
            FocusControl = DBEFTroqueles2
          end
          object LFLabel1: TLFLabel
            Left = 26
            Top = 52
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modelo Caja'
          end
          object LFLabel7: TLFLabel
            Left = 39
            Top = 96
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bobinado'
          end
          object LFBandaEstamp: TLFLabel
            Left = 346
            Top = 120
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banda Estampaci'#243'n'
            FocusControl = DBEBandaEstamp
          end
          object LFAvanceEstamp: TLFLabel
            Left = 544
            Top = 120
            Width = 101
            Height = 13
            Alignment = taRightJustify
            Caption = 'Avance Estampaci'#243'n'
            FocusControl = DBEAvanceEstamp
          end
          object LAncho2: TLFLabel
            Left = 142
            Top = 173
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho'
          end
          object LSHAncho2: TLFLabel
            Left = 240
            Top = 172
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'S. Ancho'
          end
          object LAvance2: TLFLabel
            Left = 350
            Top = 173
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Avance'
          end
          object LSVAvance2: TLFLabel
            Left = 450
            Top = 173
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'S. Avance'
          end
          object LEscandallo: TLFLabel
            Left = 241
            Top = 8
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escandallo'
          end
          object LForma: TLFLabel
            Left = 647
            Top = 151
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma'
          end
          object LZ: TLFLabel
            Left = 570
            Top = 151
            Width = 7
            Height = 13
            Alignment = taRightJustify
            Caption = 'Z'
          end
          object LZ2: TLFLabel
            Left = 570
            Top = 173
            Width = 7
            Height = 13
            Alignment = taRightJustify
            Caption = 'Z'
          end
          object LForma2: TLFLabel
            Left = 647
            Top = 173
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma'
          end
          object DBEEtiquetas_por_rollo: TLFDbedit
            Left = 89
            Top = 70
            Width = 65
            Height = 21
            DataField = 'ETIQUETAS_X_ROLLO'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 8
          end
          object DBEDiametro_Exterior: TLFDbedit
            Left = 598
            Top = 48
            Width = 65
            Height = 21
            DataField = 'DIAMETRO_EXTERIOR'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 7
          end
          object DBEEtiquetas_al_ancho: TLFDbedit
            Left = 288
            Top = 70
            Width = 73
            Height = 21
            DataField = 'ETIQUETAS_AL_ANCHO'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 9
          end
          object DBEFTroqueles: TLFDBEditFind2000
            Left = 89
            Top = 148
            Width = 40
            Height = 21
            DataField = 'TROQUELES'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 20
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_TROQUELES'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'AVANCE'
              'SH_ANCHO'
              'SV_AVANCE'
              'MAQUINA'
              'POS_Z')
            CampoNum = 'TROQUEL'
            CampoStr = 'ANCHO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TROQUEL')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDiametro_Interior: TLFDbedit
            Left = 443
            Top = 48
            Width = 65
            Height = 21
            DataField = 'DIAMETRO_INTERIOR'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 6
          end
          object LFDBPUBLICACION_WEB: TLFDBCheckBox
            Left = 204
            Top = 115
            Width = 98
            Height = 17
            Caption = 'Publicar en web'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 17
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PUBLICACION_WEB'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEArticulo: TLFDbedit
            Left = 89
            Top = 4
            Width = 141
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'ARTICULO'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEFotograbado: TLFDbedit
            Left = 444
            Top = 92
            Width = 88
            Height = 21
            DataField = 'FOTOGRABADO'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 14
          end
          object DBEEtiqetasPorCaja: TLFDbedit
            Left = 443
            Top = 70
            Width = 131
            Height = 21
            DataField = 'ETIQUETA_X_CAJA'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 10
          end
          object DBCBReimpresion: TLFDBCheckBox
            Left = 616
            Top = 25
            Width = 83
            Height = 17
            Caption = 'Reimpresi'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'REIMPRESION'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMNotas: TLFDBMemo
            Left = 89
            Top = 201
            Width = 691
            Height = 88
            Anchors = [akLeft, akTop, akRight]
            DataField = 'OBSERVACIONES_ETIQ'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 34
          end
          object DBEAnchoFilmVerif: TLFDbedit
            Left = 647
            Top = 92
            Width = 85
            Height = 21
            DataField = 'ANCHO_FILM_ESTAMP'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 15
          end
          object DBDEFechaImagenWeb: TLFDBDateEdit
            Left = 89
            Top = 115
            Width = 97
            Height = 21
            TabStop = False
            DataField = 'FECHA_IMAGEN_WEB'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 16
          end
          object DBEFTroqueles2: TLFDBEditFind2000
            Left = 89
            Top = 170
            Width = 40
            Height = 21
            DataField = 'TROQUELES_2'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 27
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_TROQUELES'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'AVANCE'
              'SH_ANCHO'
              'SV_AVANCE'
              'MAQUINA'
              'POS_Z')
            CampoNum = 'TROQUEL'
            CampoStr = 'ANCHO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TROQUEL')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFModeloCaja: TLFDBEditFind2000
            Left = 89
            Top = 48
            Width = 65
            Height = 21
            DataField = 'CODIGO_MODELOCAJA'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 4
            OnChange = DBEFModeloCajaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'TIPO_AUX='#39'CAJ'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object EDescripcionModeloCaja: TLFEdit
            Left = 156
            Top = 48
            Width = 205
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object EDescripcionBobinado: TLFEdit
            Left = 158
            Top = 92
            Width = 187
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBEFBobinado: TLFDBEditFind2000
            Left = 89
            Top = 92
            Width = 66
            Height = 21
            DataField = 'BOBINADO'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 12
            OnChange = DBEFBobinadoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CondicionBusqueda = 'TIPO_AUX='#39'BOB'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object DBCBRELIEVE_EN_SECO: TLFDBCheckBox
            Left = 634
            Top = 73
            Width = 97
            Height = 17
            Caption = 'Relieve en seco'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RELIEVE_EN_SECO'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEBandaEstamp: TLFDbedit
            Left = 444
            Top = 115
            Width = 88
            Height = 21
            DataField = 'BANDA_ESTAMPACION'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 18
          end
          object DBEAvanceEstamp: TLFDbedit
            Left = 647
            Top = 115
            Width = 85
            Height = 21
            DataField = 'AVANCE_ESTAMPACION'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            TabOrder = 19
          end
          object DBEAncho: TLFDbedit
            Left = 178
            Top = 148
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ANCHO'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
          end
          object DBESHAncho: TLFDbedit
            Left = 290
            Top = 148
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SH_ANCHO'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
          end
          object DBEAvance: TLFDbedit
            Left = 392
            Top = 148
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'AVANCE'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
          end
          object DBESVAvance: TLFDbedit
            Left = 503
            Top = 148
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SV_AVANCE'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
          end
          object DBEAncho_2: TLFDbedit
            Left = 178
            Top = 170
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ANCHO_2'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 28
          end
          object DBESHAncho_2: TLFDbedit
            Left = 290
            Top = 170
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SH_ANCHO_2'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 29
          end
          object DBEAvance_2: TLFDbedit
            Left = 392
            Top = 170
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'AVANCE_2'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 30
          end
          object DBESVAvance_2: TLFDbedit
            Left = 503
            Top = 170
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SV_AVANCE_2'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 31
          end
          object DBEEscandallo: TLFDbedit
            Left = 298
            Top = 4
            Width = 65
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'ESCANDALLO'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBETituloArticulo: TLFDbedit
            Left = 89
            Top = 26
            Width = 480
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ARTICULO'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBESVAvanceFORMA: TLFDbedit
            Left = 679
            Top = 148
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FORMA'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 26
          end
          object DBESVAvancePOS_Z: TLFDbedit
            Left = 582
            Top = 148
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'POS_Z'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 25
          end
          object DBESVAvanceFORMA_2: TLFDbedit
            Left = 679
            Top = 170
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FORMA_2'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 33
          end
          object DBESVAvancePOS_Z_2: TLFDbedit
            Left = 582
            Top = 170
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'POS_Z_2'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 32
          end
        end
        object PNLDetalle: TLFPanel
          Left = 0
          Top = 302
          Width = 810
          Height = 361
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFColores: TDBGridFind2000
            Left = 0
            Top = 29
            Width = 810
            Height = 110
            Align = alClient
            DataSource = ZDMFichaTecArt.DSQMFichaTecColores
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGFColoresDrawColumnCell
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 1
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
            Transaction = ProDMEscandallo.TLocal
            BuscarNums = False
            Campos.Strings = (
              'COLOR'
              'ID_ANILOX'
              'MAQUINA')
            CamposAMostrar.Strings = (
              'COLOR'
              '0'
              'ID_ANILOX'
              '0'
              'MAQUINA'
              '0')
            CamposAMostrarAnchos.Strings = (
              '80'
              '80'
              '80'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            Numericos.Strings = (
              'CODIGO'
              'ID_ANILOX'
              'CODMAQ')
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tablas.Strings = (
              'ETI_COLOR'
              'ETI_ANILOX'
              'PRO_MAQUINAS_C')
            Acciones.Strings = (
              ''
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TITULO'
              'DESCRIPCION')
            Posicion = tpCentrado
            Planes.Strings = (
              ''
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'CODIGO'
              'ID_ANILOX'
              'CODMAQ'
              'TIPO'
              'TIPO'
              'ID_EQUIVAL'
              'CODIGO'
              'TIPO'
              'ID_FORMULA'
              'LINEA_TAREA'
              'ALMACEN')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COLOR'
                Width = 55
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_COLOR'
                ReadOnly = True
                Width = 174
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COLOR_DECIMAL'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_ANILOX'
                Width = 39
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_ANILOX'
                ReadOnly = True
                Width = 179
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MAQUINA'
                Visible = True
              end>
          end
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 810
            Height = 29
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavFichaTecColores: THYMNavigator
              Left = 0
              Top = 2
              Width = 200
              Height = 22
              DataSource = ZDMFichaTecArt.DSQMFichaTecColores
              Flat = True
              ParentShowHint = False
              PopupMenu = CEMainPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFColores
              InsertaControl = DBGFColores
              Exclusivo = True
              ControlEdit = CEMain
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object PNLEscandallo: TLFPanel
            Left = 0
            Top = 139
            Width = 810
            Height = 222
            Align = alBottom
            TabOrder = 2
            object DBGFTareas: TDBGridFind2000
              Left = 1
              Top = 1
              Width = 808
              Height = 110
              Align = alTop
              DataSource = ZDMFichaTecArt.DSQMProTareaEsc
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FSMain
              Insercion = False
              ColumnaInicial = 1
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
              Transaction = ProDMEscandallo.TLocal
              BuscarNums = False
              Campos.Strings = (
                'ALMACEN'
                'COMPONENTE'
                'MATESC'
                'UNIDAD_FAB'
                'UNIDAD_ART'
                'ID_EQUIVAL'
                'DES_TIPO_PIEZA'
                'DES_TIPO_MATERIAL'
                'FORMULA'
                'LINEA_TAREA'
                'ALMACEN_SAL')
              CamposAMostrar.Strings = (
                'ALMACEN'
                '0'
                'COMPONENTE'
                '0'
                'MATESC'
                '1'
                'VERSION_ESCANDALLO'
                'UNIDAD_FAB'
                '0'
                'UNIDAD_ART'
                '0'
                'ID_EQUIVAL'
                '0'
                'DES_TIPO_PIEZA'
                '0'
                'DES_TIPO_MATERIAL'
                '0'
                'FORMULA'
                '0'
                'LINEA_TAREA'
                '0'
                'ALMACEN_SAL'
                '0')
              CamposAMostrarAnchos.Strings = (
                '80'
                '80'
                '80'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0')
              CamposADevolver.Strings = (
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                'ID_FORMULA'
                ''
                '')
              CamposDesplegar.Strings = (
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'ACTUALIZA_MAT'
                'ALMACEN'
                'COMPONENTE'
                'ORDEN'
                'LINEA_COMP'
                'LINEA_FASE'
                'PORCENTAJE'
                'UNIDADES'
                'ALMACEN_SAL'
                'TIPO'
                'TIPO_PIEZA')
              ColumnasCheckBoxes.Strings = (
                'ACTUALIZA_MAT'
                'PORCENT_SN'
                'TIENE_ADJUNTO'
                'UNIDADES_FIJAS')
              ColumnasChecked.Strings = (
                '1'
                '1'
                '1'
                '1')
              ColumnasNoChecked.Strings = (
                '0'
                '0'
                '0'
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'ALMACEN'
                'ARTICULO'
                'ESCANDALLO'
                'TIPO'
                'TIPO'
                'ID_EQUIVAL'
                'CODIGO'
                'TIPO'
                'ID_FORMULA'
                'LINEA_TAREA'
                'ALMACEN')
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tablas.Strings = (
                'ART_ALMACENES'
                'VER_ARTICULOS_EF'
                'PRO_ESCANDALLO'
                'SYS_UNIDADES_ARTICULOS'
                'SYS_UNIDADES_ARTICULOS'
                'PRO_SYS_CAB_EQUIVAL'
                'PRO_DES_TIPO_PIEZA'
                'PRO_DES_CAB_MATERIAL'
                'PRO_FORMULAS'
                'PRO_TAREA_ESC'
                'ART_ALMACENES')
              Acciones.Strings = (
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                '')
              Titulos.Strings = (
                'TITULO'
                'TITULO'
                'COMPUESTO'
                'TITULO'
                'TITULO'
                'DESC_EQUIVAL'
                'DESCRIPCION'
                'DESCRIPCION'
                'NOMBRE'
                'TAREA'
                'TITULO')
              Posicion = tpCentrado
              Planes.Strings = (
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'ALMACEN'
                'ARTICULO'
                'ESCANDALLO'
                'TIPO'
                'TIPO'
                'ID_EQUIVAL'
                'CODIGO'
                'TIPO'
                'ID_FORMULA'
                'LINEA_TAREA'
                'ALMACEN')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TIPOTAREA'
                  Width = 94
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TAREA'
                  Visible = True
                end>
            end
            object DBGFMateriales: TDBGridFind2000
              Left = 1
              Top = 111
              Width = 808
              Height = 110
              Align = alClient
              DataSource = ZDMFichaTecArt.DSQMProMatEsc
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FSMain
              Insercion = False
              ColumnaInicial = 1
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
              Transaction = ProDMEscandallo.TLocal
              BuscarNums = False
              Campos.Strings = (
                'ALMACEN'
                'COMPONENTE'
                'MATESC'
                'UNIDAD_FAB'
                'UNIDAD_ART'
                'ID_EQUIVAL'
                'DES_TIPO_PIEZA'
                'DES_TIPO_MATERIAL'
                'FORMULA'
                'LINEA_TAREA'
                'ALMACEN_SAL')
              CamposAMostrar.Strings = (
                'ALMACEN'
                '0'
                'COMPONENTE'
                '0'
                'MATESC'
                '1'
                'VERSION_ESCANDALLO'
                'UNIDAD_FAB'
                '0'
                'UNIDAD_ART'
                '0'
                'ID_EQUIVAL'
                '0'
                'DES_TIPO_PIEZA'
                '0'
                'DES_TIPO_MATERIAL'
                '0'
                'FORMULA'
                '0'
                'LINEA_TAREA'
                '0'
                'ALMACEN_SAL'
                '0')
              CamposAMostrarAnchos.Strings = (
                '80'
                '80'
                '80'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0')
              CamposADevolver.Strings = (
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                'ID_FORMULA'
                ''
                '')
              CamposDesplegar.Strings = (
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'ACTUALIZA_MAT'
                'ALMACEN'
                'COMPONENTE'
                'ORDEN'
                'LINEA_COMP'
                'LINEA_FASE'
                'PORCENTAJE'
                'UNIDADES'
                'ALMACEN_SAL'
                'TIPO'
                'TIPO_PIEZA')
              ColumnasCheckBoxes.Strings = (
                'ACTUALIZA_MAT'
                'PORCENT_SN'
                'TIENE_ADJUNTO'
                'UNIDADES_FIJAS')
              ColumnasChecked.Strings = (
                '1'
                '1'
                '1'
                '1')
              ColumnasNoChecked.Strings = (
                '0'
                '0'
                '0'
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'ALMACEN'
                'ARTICULO'
                'ESCANDALLO'
                'TIPO'
                'TIPO'
                'ID_EQUIVAL'
                'CODIGO'
                'TIPO'
                'ID_FORMULA'
                'LINEA_TAREA'
                'ALMACEN')
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tablas.Strings = (
                'ART_ALMACENES'
                'VER_ARTICULOS_EF'
                'PRO_ESCANDALLO'
                'SYS_UNIDADES_ARTICULOS'
                'SYS_UNIDADES_ARTICULOS'
                'PRO_SYS_CAB_EQUIVAL'
                'PRO_DES_TIPO_PIEZA'
                'PRO_DES_CAB_MATERIAL'
                'PRO_FORMULAS'
                'PRO_TAREA_ESC'
                'ART_ALMACENES')
              Acciones.Strings = (
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                '')
              Titulos.Strings = (
                'TITULO'
                'TITULO'
                'COMPUESTO'
                'TITULO'
                'TITULO'
                'DESC_EQUIVAL'
                'DESCRIPCION'
                'DESCRIPCION'
                'NOMBRE'
                'TAREA'
                'TITULO')
              Posicion = tpCentrado
              Planes.Strings = (
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'ALMACEN'
                'ARTICULO'
                'ESCANDALLO'
                'TIPO'
                'TIPO'
                'ID_EQUIVAL'
                'CODIGO'
                'TIPO'
                'ID_FORMULA'
                'LINEA_TAREA'
                'ALMACEN')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COMPONENTE'
                  Title.Caption = 'Material'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_ARTICULO'
                  Title.Caption = 'Descripci'#243'n'
                  Width = 364
                  Visible = True
                end>
            end
          end
        end
      end
      object TSDibujo: TTabSheet [1]
        Caption = '&Dibujo'
        ImageIndex = 2
        object TBArticuloTextos: TLFToolBar
          Left = 0
          Top = 0
          Width = 810
          Height = 26
          Caption = 'TBColor'
          DockSite = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLDibujoArticulo: TLFPanel
            Left = 0
            Top = 0
            Width = 526
            Height = 22
            BevelOuter = bvNone
            PopupMenu = CEDibujoPMEdit
            TabOrder = 1
            object LDibujoArticulo: TLFLabel
              Left = 8
              Top = 5
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Art'#237'culo'
              FocusControl = DBEDibujoArticulo
            end
            object DBEDibujoArticulo: TLFDbedit
              Left = 49
              Top = 1
              Width = 141
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = ZDMFichaTecArt.DSQMFichaTecArt
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object ToolButton2: TToolButton
            Left = 526
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavArticulosTextos: THYMNavigator
            Left = 534
            Top = 0
            Width = 200
            Height = 22
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDibujoPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFArticuloTextos
            InsertaControl = DBGFArticuloTextos
            Exclusivo = True
            ControlEdit = CEDibujo
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFArticuloTextos: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 810
          Height = 637
          Align = alClient
          DataSource = ZDMFichaTecArt.DSQMArticuloTextos
          PopupMenu = CEDibujoPMEdit
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
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
          IndiceBitmapAscendente = 0
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 0
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'CODIGO_COLOR'
            'CODIGO_ANILOX')
          CamposAMostrar.Strings = (
            'CODIGO_COLOR'
            '0'
            'CODIGO_ANILOX'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODIGO'
            'CODIGO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'Z_SYS_TABLAS_AUXILIARES'
            'Z_SYS_TABLAS_AUXILIARES')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'DESCRIPCION'
            'DESCRIPCION')
          Posicion = tpCentrado
          OnBusqueda = DBGFArticuloTextosBusqueda
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'CODIGO'
            'CODIGO')
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COD_ART_TEXTO'
              ReadOnly = True
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TEXTO'
              Width = 145
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_COLOR'
              Width = 38
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Codigo_color_descripcion'
              ReadOnly = True
              Width = 171
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_ANILOX'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DescAnilox'
              ReadOnly = True
              Width = 168
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUERPO_IMPRESION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMP_PANTONE'
              Width = 65
              Visible = True
            end>
        end
      end
      object TSNotas: TTabSheet [2]
        Caption = '&Notas'
        ImageIndex = 3
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 810
          Height = 26
          Caption = 'TBNotas'
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          PopupMenu = CENotasPMEdit
          TabOrder = 0
          Separators = True
          object NavNotas: THYMNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 22
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMMNotas
            InsertaControl = DBMMNotas
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton1: TToolButton
            Left = 80
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object PInfo: TLFPanel
            Left = 88
            Top = 0
            Width = 621
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LNotasArticulo: TLFLabel
              Left = 8
              Top = 5
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Art'#237'culo'
              FocusControl = DBENotasArticulo
            end
            object DBENotasArticulo: TLFDbedit
              Left = 49
              Top = 1
              Width = 141
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = ZDMFichaTecArt.DSQMFichaTecArt
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
        object PNotas: TLFPanel
          Left = 0
          Top = 26
          Width = 810
          Height = 637
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 810
            Height = 637
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            DataField = 'NOTAS'
            DataSource = ZDMFichaTecArt.DSQMFichaTecArt
            PopupMenu = CENotasPMEdit
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 810
          Height = 663
          DataSource = ZDMFichaTecArt.DSQMFichaTecArt
          CamposAOrdenar.Strings = (
            'ANCHO'
            'ANCHO_2'
            'ANCHO_FILM_ESTAMP'
            'ARTICULO'
            'AVANCE'
            'AVANCE_2'
            'AVANCE_ESTAMPACION'
            'BANDA_ESTAMPACION'
            'BOBINADO'
            'CODIGO_BARNIZ'
            'CODIGO_BARNIZ_2'
            'CODIGO_ESTAMPACION'
            'CODIGO_MODELOCAJA'
            'DIAMETRO_EXTERIOR'
            'DIAMETRO_INTERIOR'
            'ESCANDALLO'
            'ETIQUETA_X_CAJA'
            'ETIQUETAS_AL_ANCHO'
            'ETIQUETAS_X_ROLLO'
            'FECHA_IMAGEN_WEB'
            'FORMA'
            'FORMA_2'
            'FOTOGRABADO'
            'ID_IMAGEN'
            'IMPRESION_ADHESIVO_1'
            'IMPRESION_ADHESIVO_2'
            'IMPRESION_ADHESIVO_3'
            'IMPRESION_CARA_1'
            'IMPRESION_CARA_2'
            'IMPRESION_CARA_3'
            'IMPRESION_DORSO_1'
            'IMPRESION_DORSO_2'
            'IMPRESION_DORSO_3'
            'MATERIAL_1'
            'MATERIAL_2'
            'MATERIAL_3'
            'OBSERVACIONES_ETIQ'
            'PATH_IMAGEN'
            'POS_Z'
            'POS_Z_2'
            'PUBLICACION_WEB'
            'REIMPRESION'
            'RELIEVE_EN_SECO'
            'SH_ANCHO'
            'SH_ANCHO_2'
            'SV_AVANCE'
            'SV_AVANCE_2'
            'TIPO_ETIQUETA'
            'TITULO_ARTICULO'
            'TROQUELES'
            'TROQUELES_2')
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_ARTICULO'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REIMPRESION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACIONES_ETIQ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ETIQUETA_X_CAJA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANCHO_FILM_ESTAMP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_IMAGEN_WEB'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FOTOGRABADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_A'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_IMAGEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_BARNIZ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_BARNIZ_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANDA_ESTAMPACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AVANCE_ESTAMPACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RELIEVE_EN_SECO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_ESTAMPACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_ETIQUETA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BOBINADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_MODELOCAJA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAMETRO_EXTERIOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAMETRO_INTERIOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ETIQUETAS_AL_ANCHO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ETIQUETAS_X_ROLLO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PATH_IMAGEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUBLICACION_WEB'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TROQUELES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TROQUELES_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESCANDALLO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANCHO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SH_ANCHO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AVANCE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SV_AVANCE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANCHO_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SH_ANCHO_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AVANCE_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SV_AVANCE_2'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 721
    Width = 822
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDibujo
    Left = 804
    Top = 39
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 803
    Top = 8
  end
  inherited ALMain: TLFActionList
    Left = 576
    Top = 36
  end
  inherited FSMain: TLFFibFormStorage
    Left = 611
    Top = 36
  end
  object OPPathImagen: TOpenPictureDialog
    Filter = 'GIF|*.gif|JPEG Image File (*.jpg)|*.jpg'
    Left = 646
    Top = 36
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNotas
    Complementario = TBMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 738
    Top = 39
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 737
    Top = 8
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEDibujo: TControlEdit
    EnlazadoA = CENotas
    PopUpMenu = CEDibujoPMEdit
    Teclas = DMMain.Teclas
    Left = 704
    Top = 40
  end
  object CEDibujoPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 704
    Top = 8
    object CEDibujoMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDibujoMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDibujoMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDibujoMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDibujoMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDibujoMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDibujoMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDibujoMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDibujoMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDibujoMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEImagen: TControlEdit
    Left = 771
    Top = 39
  end
  object CEImagenPMEdit: TPopUpTeclas
    Left = 770
    Top = 8
    object CEImagenMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEImagenMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEImagenMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEImagenMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEImagenMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEImagenMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEImagenMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImagenMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImagenMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImagenMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
