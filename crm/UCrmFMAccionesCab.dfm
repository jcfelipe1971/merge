inherited CrmFMAccionesCab: TCrmFMAccionesCab
  Left = 394
  Top = 142
  Caption = 'Mantenimiento Acciones'
  ClientHeight = 399
  ClientWidth = 570
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 570
    Height = 375
    inherited TBMain: TLFToolBar
      Width = 566
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = CrmDMAccionesCab.DSQMAccionesCab
        Hints.Strings = ()
        ModoDeSeguridad = False
        EditaControl = DBEFTipoAccion
        InsertaControl = DBEFTipoAccion
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
      end
    end
    inherited PCMain: TLFPageControl
      Width = 566
      Height = 345
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 558
          Height = 317
          inherited G2KTableLoc: TG2KTBLoc
            Left = 100
            Top = 70
            DataSource = CrmDMAccionesCab.DSQMAccionesCab
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CRM_ACCIONES'
            CampoNum = 'ID'
            CampoStr = 'DESCRIPCION_ACCION'
            Entorno = DMMain.EntornoBusqueda
          end
          object LblDescripcionAccionProx: TLFLabel
            Left = 39
            Top = 82
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcionAccion
          end
          object LblFechaAccionProx: TLFLabel
            Left = 65
            Top = 61
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
            FocusControl = DBDEFechaAccionProx
          end
          object LblTipoAccionProx: TLFLabel
            Left = 74
            Top = 38
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
            FocusControl = DBEFTipoAccion
          end
          object LNotas: TLFLabel
            Left = 67
            Top = 150
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LblIdContacto: TLFLabel
            Left = 84
            Top = 16
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
            FocusControl = DBEIdContacto
          end
          object LFechaPrev: TLFLabel
            Left = 7
            Top = 105
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Prev. Cierre'
            FocusControl = LFDBFechaPrev
          end
          object LFechaRealCierre: TLFLabel
            Left = 275
            Top = 105
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Real Cierre'
            FocusControl = LFDBFechaReal
          end
          object LComentario: TLFLabel
            Left = 42
            Top = 262
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object LNroContactos: TLFLabel
            Left = 378
            Top = 61
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Contactos'
          end
          object LProyecto: TLFLabel
            Left = 53
            Top = 127
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
            FocusControl = DBEFProyecto
          end
          object DBDEFechaAccionProx: TLFDBDateEdit
            Left = 99
            Top = 57
            Width = 121
            Height = 21
            DataField = 'FECHA_ACCION'
            DataSource = CrmDMAccionesCab.DSQMAccionesCab
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBEDescripcionAccion: TLFDbedit
            Left = 99
            Top = 79
            Width = 386
            Height = 21
            DataField = 'DESCRIPCION_ACCION'
            DataSource = CrmDMAccionesCab.DSQMAccionesCab
            TabOrder = 3
          end
          object DBEFTipoAccion: TLFDBEditFind2000
            Left = 99
            Top = 35
            Width = 87
            Height = 21
            DataField = 'TIPO_ACCION'
            DataSource = CrmDMAccionesCab.DSQMAccionesCab
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CRM_SYS_ACCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              '')
            CampoNum = 'ACCION'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ACCION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBRENotasAccDet: TDBRichEdit
            Left = 99
            Top = 145
            Width = 386
            Height = 114
            DataField = 'NOTAS'
            DataSource = CrmDMAccionesCab.DSQMAccionesCab
            ScrollBars = ssVertical
            TabOrder = 6
          end
          object DBEIdContacto: TLFDbedit
            Left = 99
            Top = 13
            Width = 87
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID'
            DataSource = CrmDMAccionesCab.DSQMAccionesCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object LFDBFechaPrev: TLFDBDateEdit
            Left = 99
            Top = 101
            Width = 121
            Height = 21
            DataField = 'FECHA_PREVISTA_CIERRE'
            DataSource = CrmDMAccionesCab.DSQMAccionesCab
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object LFDBFechaReal: TLFDBDateEdit
            Left = 364
            Top = 101
            Width = 121
            Height = 21
            DataField = 'FECHA_CIERRE_REAL'
            DataSource = CrmDMAccionesCab.DSQMAccionesCab
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            NumGlyphs = 2
            TabOrder = 5
          end
          object DBComentario: TDBRichEdit
            Left = 99
            Top = 260
            Width = 386
            Height = 48
            DataField = 'COMENTARIO_CIERRE'
            DataSource = CrmDMAccionesCab.DSQMAccionesCab
            ScrollBars = ssVertical
            TabOrder = 7
          end
          object DBENroContactos: TLFDbedit
            Left = 445
            Top = 57
            Width = 40
            Height = 21
            Color = clInfoBk
            DataField = 'NUMERO_CONTACTOS'
            DataSource = CrmDMAccionesCab.DSQMAccionesCab
            ReadOnly = True
            TabOrder = 8
          end
          object DBEFProyecto: TLFDBEditFind2000
            Left = 99
            Top = 123
            Width = 87
            Height = 21
            DataField = 'PROYECTO'
            DataSource = CrmDMAccionesCab.DSQMAccionesCab
            ParentShowHint = False
            ShowHint = False
            TabOrder = 9
            OnChange = DBEFProyectoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              '')
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EProyecto: TLFEdit
            Left = 187
            Top = 123
            Width = 298
            Height = 21
            Color = clInfoBk
            TabOrder = 10
            Text = 'EProyecto'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 558
          Height = 317
          DataSource = CrmDMAccionesCab.DSQMAccionesCab
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_ACCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ACCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_ACCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_CONTACTOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PREVISTA_CIERRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 375
    Width = 570
  end
  inherited CEMain: TControlEdit
    Left = 192
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 244
    Top = 12
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 304
    Top = 24
  end
  inherited FSMain: TLFFibFormStorage
    Left = 352
    Top = 24
  end
end
