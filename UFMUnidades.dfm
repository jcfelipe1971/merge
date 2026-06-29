inherited FMUnidades: TFMUnidades
  Left = 463
  Top = 306
  HelpContext = 289
  Caption = 'Unidades'
  ClientHeight = 218
  ClientWidth = 390
  PopupMenu = ControlEdit1PMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = DMUnidades.DSQMUnidades
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETipo
        OnClickBefore = NavMainClickBefore
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 274
      end
      inherited TbuttComp: TToolButton
        Left = 282
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          object LBLTipo: TLFLabel
            Left = 45
            Top = 30
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LBLTitulo: TLFLabel
            Left = 38
            Top = 52
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLSigno: TLFLabel
            Left = 39
            Top = 74
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Signo'
          end
          object LBLDecimales: TLFLabel
            Left = 17
            Top = 96
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Decimales'
          end
          object DBETipo: TLFDbedit
            Left = 70
            Top = 26
            Width = 45
            Height = 21
            DataField = 'TIPO'
            DataSource = DMUnidades.DSQMUnidades
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 70
            Top = 48
            Width = 298
            Height = 21
            DataField = 'TITULO'
            DataSource = DMUnidades.DSQMUnidades
            TabOrder = 1
          end
          object DBESigno: TLFDbedit
            Left = 70
            Top = 70
            Width = 45
            Height = 21
            DataField = 'SIGNO'
            DataSource = DMUnidades.DSQMUnidades
            TabOrder = 2
          end
          object DBEDecimales: TLFDbedit
            Left = 70
            Top = 92
            Width = 45
            Height = 21
            DataField = 'DECIMALES'
            DataSource = DMUnidades.DSQMUnidades
            TabOrder = 3
          end
        end
      end
      object TSIdioma: TTabSheet [1]
        Caption = 'Idioma'
        ImageIndex = 2
        object TBIdioma: TLFToolBar
          Left = 0
          Top = 0
          Width = 378
          Height = 24
          AutoSize = True
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 0
          Separators = True
          object NavIdioma: THYMNavigator
            Left = 0
            Top = 2
            Width = 220
            Height = 22
            DataSource = DMUnidades.DSQMUnidadesIdioma
            Flat = True
            ParentShowHint = False
            PopupMenu = ControlEdit1PMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGIdioma
            InsertaControl = DBGIdioma
            OnClickBefore = NavMainClickBefore
            Exclusivo = True
            ControlEdit = CEIdioma
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGIdioma: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 378
          Height = 112
          Align = alClient
          DataSource = DMUnidades.DSQMUnidadesIdioma
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
            'IDIOMA')
          CamposAMostrar.Strings = (
            'IDIOMA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
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
              FieldName = 'TITULO'
              Width = 260
              Visible = True
            end>
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMUnidades.DSQMUnidades
          CamposAOrdenar.Strings = (
            'DECIMALES'
            'SIGNO'
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 203
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SIGNO'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECIMALES'
              Width = 55
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
  end
  inherited CEMain: TControlEdit
    Left = 264
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 300
    Top = 34
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 230
    Top = 144
  end
  inherited FSMain: TLFFibFormStorage
    Left = 270
    Top = 144
  end
  object CEIdioma: TControlEdit
    FichaEdicion = TSIdioma
    SubComplementario = CEMain
    PopUpMenu = ControlEdit1PMEdit
    Teclas = DMMain.Teclas
    Left = 264
    Top = 64
  end
  object ControlEdit1PMEdit: TPopUpTeclas
    Left = 300
    Top = 64
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
