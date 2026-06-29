inherited FMNominasPlantillas: TFMNominasPlantillas
  Left = 414
  Top = 182
  Caption = 'Plantillas conceptos n'#243'minas'
  ClientHeight = 663
  ClientWidth = 973
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 973
    Height = 185
    inherited TBMain: TLFToolBar
      Width = 969
      inherited NavMain: THYMNavigator
        DataSource = DMNominasPlantillas.DSQMNomPlantilla
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TbuttComp: TToolButton
        Hint = 'Exportar a  Excel'
        ImageIndex = 36
        Visible = True
        OnClick = TbuttCompClick
      end
      object TBImportarExcel: TToolButton
        Left = 319
        Top = 0
        Hint = 'Importar desde Excel'
        Caption = 'TBImportarExcel'
        ImageIndex = 123
        OnClick = TBImportarExcelClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 969
      Height = 155
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 961
          Height = 127
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMNominasPlantillas.DSQMNomPlantilla
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_NOMINAS_PLANTILLA'
            CampoNum = 'ID'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID')
          end
          object LID: TLFLabel
            Left = 62
            Top = 34
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object LTitulo: TLFLabel
            Left = 45
            Top = 56
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEID: TLFDbedit
            Left = 79
            Top = 31
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'ID'
            DataSource = DMNominasPlantillas.DSQMNomPlantilla
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 79
            Top = 53
            Width = 370
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMNominasPlantillas.DSQMNomPlantilla
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 961
          Height = 127
          DataSource = DMNominasPlantillas.DSQMNomPlantilla
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end>
        end
        inherited BMaximizarTabla: TButton
          Left = 444
          Top = 119
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 185
    Width = 973
    Height = 454
    inherited TBDetalle: TLFToolBar
      Width = 973
      inherited NavDetalle: THYMNavigator
        DataSource = DMNominasPlantillas.DSQMNomPlantillaConf
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 973
      Height = 432
      DataSource = DMNominasPlantillas.DSQMNomPlantillaConf
      PopupMenu = nil
      Transaction = DMMain.TLocal
      Campos.Strings = (
        'CONCEPTO')
      CamposAMostrar.Strings = (
        'CONCEPTO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CamposAOrdernar.Strings = (
        'TIPO'
        'ORDEN'
        'CONCEPTO')
      Numericos.Strings = (
        'CODIGO')
      Tablas.Strings = (
        'EMP_CONCEPTO_HABERES')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'GLOSA')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        '')
      OrdenadosPor.Strings = (
        'CODIGO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          PickList.Strings = (
            'H'
            'D'
            'P')
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONCEPTO'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Glosa'
          Width = 281
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN'
          Width = 82
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 639
    Width = 973
  end
  inherited CEDetalle: TControlEdit
    Left = 294
    Top = 168
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 346
    Top = 170
  end
end
