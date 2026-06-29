inherited IsoFMCursos: TIsoFMCursos
  Left = 369
  Top = 194
  Caption = 'Mantenimiento de Cursos'
  PopupMenu = CENotasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = IsoDMCursos.DSCursos
        Hints.Strings = ()
        EditaControl = LFDDesc
        InsertaControl = LFDDesc
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            Top = 16
            DataSource = IsoDMCursos.DSCursos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ISO_CURSOS'
            CampoNum = 'ID_CURSO'
            CampoStr = 'DESCRIPCION'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID_CURSO')
          end
          object LCurso: TLFLabel
            Left = 38
            Top = 57
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Curso'
          end
          object LDescripcion: TLFLabel
            Left = 9
            Top = 79
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LHoras: TLFLabel
            Left = 37
            Top = 123
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horas'
          end
          object LProfesor: TLFLabel
            Left = 26
            Top = 101
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Profesor'
          end
          object LFDBCurso: TLFDbedit
            Left = 69
            Top = 53
            Width = 41
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_CURSO'
            DataSource = IsoDMCursos.DSCursos
            TabOrder = 0
          end
          object LFDDesc: TLFDbedit
            Left = 69
            Top = 75
            Width = 401
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = IsoDMCursos.DSCursos
            TabOrder = 1
          end
          object LFDBHoras: TLFDbedit
            Left = 69
            Top = 119
            Width = 73
            Height = 21
            DataField = 'HORAS'
            DataSource = IsoDMCursos.DSCursos
            TabOrder = 3
          end
          object LFDProfesor: TLFDbedit
            Left = 69
            Top = 97
            Width = 401
            Height = 21
            DataField = 'PROFESOR'
            DataSource = IsoDMCursos.DSCursos
            TabOrder = 2
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = 'Notas'
        ImageIndex = 2
        object LFPanelNotas: TLFPanel
          Left = 0
          Top = 26
          Width = 490
          Height = 248
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFDBNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 490
            Height = 248
            Align = alClient
            DataField = 'NOTAS'
            DataSource = IsoDMCursos.DSCursos
            TabOrder = 0
          end
        end
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 490
          Height = 26
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object NavNotas: THYMNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 22
            DataSource = IsoDMCursos.DSCursos
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = LFDBNotas
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = IsoDMCursos.DSCursos
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_CURSO'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 329
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORAS'
              Width = 60
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 400
    Top = 84
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 428
    Top = 84
  end
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listado'
      Caption = 'Listado'
      ImageIndex = 14
    end
    object ALstCertificado: TAction
      Category = 'Listado'
      Caption = 'Listado Certificado Formaci'#243'n'
      ImageIndex = 14
      OnExecute = ALstCertificadoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listado Configuracion'
      Caption = 'Listado Configuracion'
      ImageIndex = 77
    end
    object ALstConfigCertificado: TAction
      Category = 'Listado Configuracion'
      Caption = 'Configuracion Certificado'
      ImageIndex = 77
      OnExecute = ALstConfigCertificadoExecute
    end
  end
  object CENotas: TControlEdit
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = LFPanelNotas
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 400
    Top = 112
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 432
    Top = 112
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
end
