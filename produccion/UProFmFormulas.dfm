inherited ProFmFormulas: TProFmFormulas
  Left = 296
  Top = 241
  Width = 812
  Height = 612
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Destino F'#243'rmulas'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 802
    Height = 142
    inherited TBMain: TLFToolBar
      Width = 798
      inherited NavMain: THYMNavigator
        DataSource = ProDmFormulas.DSQMProFormulas
        Hints.Strings = ()
        EditaControl = LFNom
        InsertaControl = LFNom
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TbuttComp: TToolButton
        ImageIndex = 3
        OnClick = AbreDetalle
      end
    end
    inherited PCMain: TLFPageControl
      Width = 798
      Height = 112
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 790
          Height = 84
          inherited G2KTableLoc: TG2KTBLoc
            Left = 464
            Top = 4
            DataSource = ProDmFormulas.DSQMProFormulas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_FORMULAS'
            CampoNum = 'ID_FORMULA'
            CampoStr = 'NOMBRE'
            OrdenadoPor.Strings = (
              'ID_FORMULA')
          end
          object Lbl_Id: TLFLabel
            Left = 37
            Top = 13
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object Lbl_nom: TLFLabel
            Left = 11
            Top = 35
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LFNom: TLFDbedit
            Left = 53
            Top = 31
            Width = 312
            Height = 21
            DataField = 'NOMBRE'
            DataSource = ProDmFormulas.DSQMProFormulas
            TabOrder = 1
          end
          object LFId: TLFDbedit
            Left = 53
            Top = 9
            Width = 79
            Height = 21
            Color = clInfoBk
            DataField = 'ID_FORMULA'
            DataSource = ProDmFormulas.DSQMProFormulas
            ReadOnly = True
            TabOrder = 0
          end
          object CBActiva: TLFDBCheckBox
            Left = 52
            Top = 56
            Width = 69
            Height = 17
            Caption = 'Activa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = ProDmFormulas.DSQMProFormulas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 790
          Height = 84
          DataSource = ProDmFormulas.DSQMProFormulas
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_FORMULA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_FORMULA'
              Width = 150
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 142
    Width = 802
    Height = 417
    inherited TBDetalle: TLFToolBar
      Width = 802
      inherited NavDetalle: THYMNavigator
        DataSource = ProDmFormulas.DSQMProFormulasDet
        Hints.Strings = ()
      end
      object ToolButton2: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object BTFormula: TToolButton
        Left = 228
        Top = 0
        Action = AAbreFormula
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 802
      Height = 395
      DataSource = ProDmFormulas.DSQMProFormulasDet
      PopupMenu = nil
      OnDblClick = AbreDetalle
      Campos.Strings = (
        'CAMPO_ESC'
        'CAMPO_ORD'
        'TABLA_ESC'
        'TABLA_ORD'
        'TABLA_DESP'
        'CAMPOS_DESP')
      CamposAMostrar.Strings = (
        'CAMPO_ESC'
        '0'
        'CAMPO_ORD'
        '0'
        'TABLA_ESC'
        '0'
        'TABLA_ORD'
        '0'
        'TABLA_DESP'
        '0'
        'CAMPOS_DESP'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        'CAMPO'
        'CAMPO'
        'TABLA'
        'TABLA'
        'TABLA'
        'CAMPO')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1'
        '1'
        '1'
        '1')
      ColumnasCheckBoxes.Strings = (
        'ACTIVO'
        'VALIDA')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0')
      Numericos.Strings = (
        'CAMPO'
        'CAMPO'
        'TABLA'
        'TABLA'
        'TABLA'
        'CAMPO')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'PRO_VER_CAMPOS'
        'PRO_VER_CAMPOS'
        'PRO_VER_TABLAS'
        'PRO_VER_TABLAS'
        'PRO_VER_TABLAS'
        'PRO_VER_CAMPOS')
      Acciones.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      Columns = <
        item
          Expanded = False
          FieldName = 'TABLA_ESC'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMPO_ESC'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TABLA_ORD'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMPO_ORD'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TABLA_DESP'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMPOS_DESP'
          Width = 120
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FORMULA'
          Width = 144
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'VALIDA'
          ReadOnly = True
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 559
    Width = 802
  end
  inherited CEMain: TControlEdit
    Left = 480
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 444
    Top = 12
  end
  inherited ALMain: TLFActionList
    Left = 560
    Top = 16
  end
  inherited FSMain: TLFFibFormStorage
    Left = 600
    Top = 16
  end
  object ALFormulas: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 560
    Top = 56
    object AAbreFormula: TAction
      Caption = 'Abre F'#243'rmula'
      Hint = 'Ctrl+Alt+F para Abrir F'#243'rmula'
      ImageIndex = 30
      ShortCut = 49222
      OnExecute = AAbreFormulaExecute
    end
  end
end
