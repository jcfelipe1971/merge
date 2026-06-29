inherited FMGruposTextos: TFMGruposTextos
  Left = 313
  Top = 188
  Caption = ' Grupos de Textos'
  ClientHeight = 218
  ClientWidth = 526
  PopupMenu = CEIdiomaPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 526
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 522
      inherited NavMain: THYMNavigator
        DataSource = DMGruposTextos.DSGrupos
        Hints.Strings = ()
        EditaControl = DBENota
        InsertaControl = DBENota
        OnClickBefore = NavMainClickBefore
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
      Width = 522
      Height = 164
      ActivePage = TSIdioma
      TabIndex = 1
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 514
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Top = 32
            DataSource = DMGruposTextos.DSGrupos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TEXTOS_GRUPOS'
            CampoNum = 'GRUPO'
            CampoStr = 'NOTA'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'NOTA')
          end
          object LBLGrupo: TLFLabel
            Left = 42
            Top = 29
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo'
          end
          object LTitulo: TLFLabel
            Left = 43
            Top = 52
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LComentario: TLFLabel
            Left = 18
            Top = 74
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object DBEGrupo: TLFDbedit
            Left = 75
            Top = 26
            Width = 59
            Height = 21
            Color = clInfoBk
            DataField = 'GRUPO'
            DataSource = DMGruposTextos.DSGrupos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBENota: TLFDbedit
            Left = 75
            Top = 48
            Width = 275
            Height = 21
            DataField = 'NOTA'
            DataSource = DMGruposTextos.DSGrupos
            TabOrder = 1
          end
          object DBETexto: TLFDbedit
            Left = 75
            Top = 70
            Width = 275
            Height = 21
            DataField = 'TEXTO'
            DataSource = DMGruposTextos.DSGrupos
            TabOrder = 2
          end
        end
      end
      object TSIdioma: TTabSheet [1]
        Caption = '&Idioma'
        ImageIndex = 2
        OnShow = TSIdiomaShow
        object PEditIdioma: TLFPanel
          Left = 0
          Top = 0
          Width = 514
          Height = 136
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBIdioma: TLFToolBar
            Left = 0
            Top = 0
            Width = 514
            Height = 26
            AutoSize = True
            BorderWidth = 1
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Wrapable = False
            Separators = True
            object NavIdioma: THYMNavigator
              Left = 0
              Top = 0
              Width = 200
              Height = 22
              DataSource = DMGruposTextos.DSQMGruposIdiomas
              Flat = True
              ParentShowHint = False
              PopupMenu = CEIdiomaPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFIdioma
              InsertaControl = DBGFIdioma
              Exclusivo = True
              ControlEdit = CEIdioma
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton1: TToolButton
              Left = 200
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object PInfoMaestro: TLFPanel
              Left = 208
              Top = 0
              Width = 191
              Height = 22
              BevelOuter = bvNone
              TabOrder = 1
              object DBEInfoMaestro: TLFDbedit
                Left = 4
                Top = 1
                Width = 184
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'NOTA'
                DataSource = DMGruposTextos.DSGrupos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clInactiveCaption
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
          object DBGFIdioma: TDBGridFind2000
            Left = 0
            Top = 26
            Width = 514
            Height = 110
            Align = alClient
            DataSource = DMGruposTextos.DSQMGruposIdiomas
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnEnter = DBGFIdiomaEnter
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
            IndiceBitmapChecked = 2
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'IDIOMA')
            CamposAMostrar.Strings = (
              'IDIOMA'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              'IDIOMA')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'NOTA'
              'TEXTO'
              'IDIOMA')
            CamposNoAccesibles.Strings = (
              'GRUPO')
            MensajeNoExiste = False
            Numericos.Strings = (
              'IDIOMA')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_IDIOMAS')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFIdiomaBusqueda
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'IDIOMA')
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'IDIOMA'
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TEXTO'
                Width = 323
                Visible = True
              end>
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 514
          Height = 136
          DataSource = DMGruposTextos.DSGrupos
          CamposAOrdenar.Strings = (
            'GRUPO'
            'NOTA'
            'TEXTO')
          Columns = <
            item
              Expanded = False
              FieldName = 'GRUPO'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TEXTO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 526
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEIdioma
    Left = 300
    Top = 44
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 360
    Top = 48
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 344
    Top = 16
  end
  inherited FSMain: TLFFibFormStorage
    Left = 382
    Top = 90
  end
  object CEIdioma: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSIdioma
    FichaExclusiva = TSIdioma
    PopUpMenu = CEIdiomaPMEdit
    Teclas = DMMain.Teclas
    Left = 312
    Top = 128
  end
  object CEIdiomaPMEdit: TPopUpTeclas
    Left = 352
    Top = 224
    object CEIdiomaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEIdiomaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEIdiomaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEIdiomaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEIdiomaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEIdiomaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEIdiomaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEIdiomaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEIdiomaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEIdiomaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
