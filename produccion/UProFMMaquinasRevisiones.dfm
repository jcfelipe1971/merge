inherited ProFMMaquinasRevisiones: TProFMMaquinasRevisiones
  Left = 251
  Top = 179
  Width = 600
  Height = 451
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento Revisiones Tipos de M'#225'quinas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 249
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = ProDMMaquinasRevisiones.DSQMTiposRevisiones
        Hints.Strings = ()
        EditaControl = DBETipoRevision
        InsertaControl = DBETipoRevision
      end
      inherited EPMain: THYMEditPanel
        Width = 21
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 249
      end
      inherited TbuttComp: TToolButton
        Left = 257
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 219
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 191
          inherited G2KTableLoc: TG2KTBLoc
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_TIPO_MAQUINAS_REVISIONES'
            CampoStr = 'DENOMINACION'
            Filtros = [obEmpresa]
          end
          object LDenominacion: TLFLabel
            Left = 8
            Top = 59
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Denominaci'#243'n'
          end
          object LFrecuencia: TLFLabel
            Left = 23
            Top = 79
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Frecuencia'
          end
          object LResponsable: TLFLabel
            Left = 14
            Top = 101
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Responsable'
          end
          object LNotas: TLFLabel
            Left = 48
            Top = 124
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LTipoRevision: TLFLabel
            Left = 11
            Top = 35
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Revisi'#243'n'
          end
          object LId: TLFLabel
            Left = 64
            Top = 12
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object MNotas: TLFDBMemo
            Left = 80
            Top = 119
            Width = 461
            Height = 55
            DataField = 'NOTAS'
            DataSource = ProDMMaquinasRevisiones.DSQMTiposRevisiones
            TabOrder = 4
          end
          object DBEResponsable: TLFDBEditFind2000
            Left = 80
            Top = 97
            Width = 66
            Height = 21
            DataField = 'RESPONSABLE'
            DataSource = ProDMMaquinasRevisiones.DSQMTiposRevisiones
            TabOrder = 3
            OnChange = DBEResponsableChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFrecuencia: TLFDbedit
            Left = 80
            Top = 75
            Width = 66
            Height = 21
            TabStop = False
            DataField = 'FRECUENCIA'
            DataSource = ProDMMaquinasRevisiones.DSQMTiposRevisiones
            TabOrder = 2
          end
          object DBETipoRevision: TLFDBEditFind2000
            Left = 80
            Top = 31
            Width = 66
            Height = 21
            DataField = 'TIPO_REVISION'
            DataSource = ProDMMaquinasRevisiones.DSQMTiposRevisiones
            TabOrder = 0
            OnChange = DBETipoRevisionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_SYS_TIPO_REVISIONES_MAQ'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEDenominacion: TLFDbedit
            Left = 80
            Top = 53
            Width = 460
            Height = 21
            DataField = 'DENOMINACION'
            DataSource = ProDMMaquinasRevisiones.DSQMTiposRevisiones
            TabOrder = 1
          end
          object DescTipoRevision: TLFHYDBDescription
            Left = 148
            Top = 31
            Width = 392
            Height = 21
            Color = clInfoBk
            DataSource = ProDMMaquinasRevisiones.DSQMTiposRevisiones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Tabla_a_buscar = 'PRO_SYS_TIPO_REVISIONES_MAQ'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPO_REVISION')
            CamposWhereTabla.Strings = (
              'TIPO')
          end
          object EResponsable: TLFEdit
            Left = 148
            Top = 96
            Width = 393
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
          object DBEId: TLFDbedit
            Left = 80
            Top = 9
            Width = 64
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID'
            DataSource = ProDMMaquinasRevisiones.DSQMTiposRevisiones
            ReadOnly = True
            TabOrder = 7
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 191
          DataSource = ProDMMaquinasRevisiones.DSQMTiposRevisiones
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_REVISION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DENOMINACION'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FRECUENCIA'
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 249
    Width = 590
    Height = 149
    inherited TBDetalle: TLFToolBar
      Width = 590
      EdgeInner = esNone
      inherited NavDetalle: THYMNavigator
        DataSource = ProDMMaquinasRevisiones.DSQMTipoRevDet
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 590
      Height = 127
      DataSource = ProDMMaquinasRevisiones.DSQMTipoRevDet
      PopupMenu = nil
      Campos.Strings = (
        'TIPO_MAQUINA')
      CamposAMostrar.Strings = (
        'TIPO_MAQUINA'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      Numericos.Strings = (
        'TIPO')
      Tablas.Strings = (
        'PRO_TIPO_MAQUINAS')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'DESCRIPCION')
      Planes.Strings = (
        '')
      OrdenadosPor.Strings = (
        'TIPO')
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO_MAQUINA'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescMaquina'
          ReadOnly = True
          Width = 494
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 590
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 360
    Top = 4
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ARevisionMaquina: TAction
      Category = 'Procesos'
      Caption = 'Actualizar Revisi'#243'n M'#225'quinas'
      ImageIndex = 25
      OnExecute = ARevisionMaquinaExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Database = nil
    Left = 288
    Top = 0
  end
end
