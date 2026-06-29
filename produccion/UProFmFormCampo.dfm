inherited ProFmFormCampo: TProFmFormCampo
  Left = 383
  Top = 240
  Width = 812
  Height = 612
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Origen F'#243'rmulas'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 802
    Height = 133
    inherited TBMain: TLFToolBar
      Width = 798
      inherited NavMain: THYMNavigator
        Width = 80
        DataSource = ProDmFormCampo.DSQmProFormulasCamp
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 80
      end
      inherited EPMain: THYMEditPanel
        Left = 88
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 148
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Left = 156
        Hint = 'Valida Formula'
        Caption = 'Valida Formula'
        ImageIndex = 3
        Visible = True
        OnClick = TbuttCompClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 798
      Height = 103
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 790
          Height = 75
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = ProDmFormCampo.DSQmProFormulasCamp
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_FORMULAS_CAMPOS_CAB'
            CampoNum = 'ID_FORMULA'
            CampoStr = 'FORMULA'
            OrdenadoPor.Strings = (
              'ID_FORMULA')
          end
          object LbFormula: TLFLabel
            Left = 20
            Top = 17
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'F'#243'rmula'
          end
          object LbEstado: TLFLabel
            Left = 24
            Top = 39
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LBLTipoRedondeo: TLFLabel
            Left = 289
            Top = 45
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Redondeo'
          end
          object LFFormula: TLFDbedit
            Left = 62
            Top = 13
            Width = 365
            Height = 21
            DataField = 'FORMULA'
            DataSource = ProDmFormCampo.DSQmProFormulasCamp
            TabOrder = 0
          end
          object DBEEstadoFormula: TLFDbedit
            Left = 62
            Top = 35
            Width = 187
            Height = 21
            Color = clInfoBk
            DataField = 'Estado_Formula'
            DataSource = ProDmFormCampo.DSQmProFormulasCamp
            Enabled = False
            TabOrder = 1
          end
          object DBEFTipoRedondeo: TLFDBEditFind2000
            Left = 357
            Top = 40
            Width = 36
            Height = 21
            DataField = 'TIPO_REDONDEO'
            DataSource = ProDmFormCampo.DSQmProFormulasCamp
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'SYS_TIPO_REDONDEOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO_REDONDEO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo_redondeo <> -1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO_REDONDEO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETipoRedondeo: TLFDbedit
            Left = 394
            Top = 40
            Width = 253
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDmFormCampo.DSxTipoRedondeo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 790
          Height = 75
          DataSource = ProDmFormCampo.DSQmProFormulasCamp
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_FORMULA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMULA'
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_FORMULA'
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 133
    Width = 802
    Height = 426
    inherited TBDetalle: TLFToolBar
      Width = 802
      inherited NavDetalle: THYMNavigator
        DataSource = ProDmFormCampo.DsQmProFormulasCampDet
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 802
      Height = 404
      DataSource = ProDmFormCampo.DsQmProFormulasCampDet
      PopupMenu = nil
      Campos.Strings = (
        'TABLA_ORD'
        'TABLA_ESC'
        'CAMPO_ESC'
        'CAMPO_ORD'
        'TABLA_DESP'
        'CAMPO_DESP')
      CamposAMostrar.Strings = (
        'TABLA_ORD'
        '0'
        'TABLA_ESC'
        '0'
        'CAMPO_ESC'
        '0'
        'CAMPO_ORD'
        '0'
        'TABLA_DESP'
        '0'
        'CAMPO_DESP'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        'TABLA'
        'TABLA'
        'CAMPO'
        'CAMPO'
        'TABLA'
        'CAMPO')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1'
        '1'
        '1'
        '1')
      Numericos.Strings = (
        'TABLA'
        'TABLA'
        'CAMPO'
        'CAMPO'
        'TABLA'
        'CAMPO')
      SalirSiVacio = True
      Tablas.Strings = (
        'PRO_VER_TABLAS'
        'PRO_VER_TABLAS'
        'PRO_VER_CAMPOS'
        'PRO_VER_CAMPOS'
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
          FieldName = 'NOMBRE'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TABLA_ESC'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMPO_ESC'
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TABLA_ORD'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMPO_ORD'
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TABLA_DESP'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMPO_DESP'
          Width = 125
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 559
    Width = 802
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
  end
end
