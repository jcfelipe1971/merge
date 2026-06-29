inherited CrmFMAcciones: TCrmFMAcciones
  Left = 295
  Top = 245
  HelpContext = 289
  Caption = 'Acciones'
  ClientHeight = 217
  ClientWidth = 566
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 566
    Height = 193
    inherited TBMain: TLFToolBar
      Width = 562
      inherited NavMain: THYMNavigator
        DataSource = CrmDMAcciones.DSQMAcciones
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEAccion
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
      Width = 562
      Height = 163
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 554
          Height = 135
          inherited G2KTableLoc: TG2KTBLoc
            Top = 35
            DataSource = CrmDMAcciones.DSQMAcciones
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CRM_SYS_ACCIONES'
            CampoNum = 'ACCION'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'ACCION')
          end
          object LblAccion: TLFLabel
            Left = 51
            Top = 24
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Acci'#243'n'
          end
          object LblDescripcion: TLFLabel
            Left = 28
            Top = 46
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LTipoSeguimiento: TLFLabel
            Left = 2
            Top = 69
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Seguimiento'
          end
          object DBEAccion: TLFDbedit
            Left = 87
            Top = 20
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ACCION'
            DataSource = CrmDMAcciones.DSQMAcciones
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 87
            Top = 42
            Width = 326
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = CrmDMAcciones.DSQMAcciones
            TabOrder = 1
          end
          object LFDBFinAccion: TLFDBCheckBox
            Left = 431
            Top = 22
            Width = 75
            Height = 17
            Caption = 'Fin Acci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FIN_ACCION'
            DataSource = CrmDMAcciones.DSQMAcciones
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBTSeg: TLFDBEditFind2000
            Left = 87
            Top = 64
            Width = 50
            Height = 21
            DataField = 'TIPO_SEG'
            DataSource = CrmDMAcciones.DSQMAcciones
            TabOrder = 3
            OnChange = LFDBTSegChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CRM_SYS_TIPO_SEG'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TSEGUIMIENTO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TSEGUIMIENTO')
            Filtros = []
          end
          object DescTSeg: TLFHYDBDescription
            Left = 137
            Top = 64
            Width = 276
            Height = 21
            Color = clInfoBk
            DataSource = CrmDMAcciones.DSQMAcciones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Tabla_a_buscar = 'CRM_SYS_TIPO_SEG'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TIPO_SEG')
            CamposWhereTabla.Strings = (
              'TSEGUIMIENTO')
          end
          object LFDBCrearSeg: TLFDBCheckBox
            Left = 431
            Top = 44
            Width = 108
            Height = 17
            Caption = 'Crear Seguimiento'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CREAR_SEGUIMIENTO'
            DataSource = CrmDMAcciones.DSQMAcciones
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 421
          Height = 135
          DataSource = CrmDMAcciones.DSQMAcciones
          CamposAOrdenar.Strings = (
            'DECIMALES'
            'SIGNO'
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ACCION'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 249
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FIN_ACCION'
              Width = 56
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 193
    Width = 566
  end
  inherited CEMain: TControlEdit
    Left = 296
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 332
    Top = 34
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 296
    Top = 72
  end
  inherited FSMain: TLFFibFormStorage
    Left = 332
    Top = 72
  end
end
