inherited ProFMTareasManu: TProFMTareasManu
  Left = 239
  Top = 179
  Caption = 'Tareas Manuales'
  ClientHeight = 218
  ClientWidth = 390
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = ProDMTareasManu.DSQMProTareasManu
        Hints.Strings = ()
        EditaControl = DBEFRecurso
        InsertaControl = DBETarea
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neRango, neReport, neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Left = 62
            Top = 13
            Plan.Strings = (
              'PLAN (PRO_SYS_FASES NATURAL)')
            Tabla_a_buscar = 'PRO_TAREAS_MANUALES'
            CampoNum = 'ID_TAREA_MAN'
          end
          object LTarea: TLFLabel
            Left = 31
            Top = 21
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarea'
            FocusControl = DBETarea
          end
          object LTiempo: TLFLabel
            Left = 24
            Top = 88
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tiempo'
            FocusControl = DBETitulo
          end
          object LRecurso: TLFLabel
            Left = 19
            Top = 44
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recurso'
          end
          object LTipoTarea: TLFLabel
            Left = 7
            Top = 66
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Tarea'
          end
          object LSepHoraMinuto: TLFLabel
            Left = 87
            Top = 85
            Width = 7
            Height = 21
            Alignment = taCenter
            AutoSize = False
            Caption = ':'
            Color = clWhite
            ParentColor = False
          end
          object LSepMinutoSegundo: TLFLabel
            Left = 119
            Top = 85
            Width = 7
            Height = 21
            Alignment = taCenter
            AutoSize = False
            Caption = ':'
            Color = clWhite
            ParentColor = False
          end
          object DBETarea: TLFDbedit
            Left = 63
            Top = 19
            Width = 54
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ID_TAREA_MAN'
            DataSource = ProDMTareasManu.DSQMProTareasManu
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 191
            Top = 85
            Width = 54
            Height = 21
            DataField = 'TIEMPO'
            DataSource = ProDMTareasManu.DSQMProTareasManu
            TabOrder = 5
            Visible = False
          end
          object DBEFRecurso: TLFDBEditFind2000
            Left = 63
            Top = 41
            Width = 54
            Height = 21
            DataField = 'ID_RECURSO'
            DataSource = ProDMTareasManu.DSQMProTareasManu
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_RECURSOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFTipTareasMan: TLFDBEditFind2000
            Left = 63
            Top = 63
            Width = 54
            Height = 21
            DataField = 'ID_TIPO_TAREA_MAN'
            DataSource = ProDMTareasManu.DSQMProTareasManu
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_TIPOS_TAREAS_MANU'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_TIPO_TAREA_MANU'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBETituloRecurso: TLFDbedit
            Left = 118
            Top = 41
            Width = 241
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMTareasManu.DSxRecursos
            Enabled = False
            TabOrder = 2
          end
          object DBETituloTarea: TLFDbedit
            Left = 118
            Top = 63
            Width = 241
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMTareasManu.DSxTipoTareaMan
            Enabled = False
            TabOrder = 4
          end
          object MaskEdit1: TMaskEdit
            Left = 215
            Top = 110
            Width = 54
            Height = 16
            AutoSize = False
            BevelInner = bvNone
            BorderStyle = bsNone
            EditMask = '<>999:99:99;1;0'
            MaxLength = 9
            TabOrder = 6
            Text = '   :  :  '
            Visible = False
            OnExit = MaskEdit1Exit
          end
          object LFEHoras: TLFEdit
            Left = 64
            Top = 85
            Width = 22
            Height = 21
            TabOrder = 7
            Text = '00'
            OnExit = LFEHorasExit
          end
          object LFEMinutos: TLFEdit
            Left = 96
            Top = 85
            Width = 22
            Height = 21
            TabOrder = 8
            Text = '00'
            OnExit = LFEMinutosExit
          end
          object LFESegundos: TLFEdit
            Left = 127
            Top = 85
            Width = 22
            Height = 21
            TabOrder = 9
            Text = '00'
            OnExit = LFESegundosExit
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ProDMTareasManu.DSQMProTareasManu
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_TAREA_MAN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_RECURSO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_TIPO_TAREA_MAN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIEMPO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
    EdgeOuter = esNone
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
  end
end
