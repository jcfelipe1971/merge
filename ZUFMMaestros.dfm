inherited ZFMMaestros: TZFMMaestros
  Left = 304
  Top = 310
  Caption = 'Mantenimiento de Maestros'
  ClientHeight = 218
  ClientWidth = 418
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 418
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 414
      inherited NavMain: THYMNavigator
        DataSource = ZDMMaestros.DSQMTablasMaestras
        Hints.Strings = ()
        EditaControl = DBECodigo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neImprime, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
        Visible = False
      end
      object PSeleccion: TLFPanel
        Left = 319
        Top = 0
        Width = 89
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LblSeleccion: TLFLabel
          Left = 11
          Top = 4
          Width = 26
          Height = 13
          Hint = 'Tipo de Maestro'
          Alignment = taRightJustify
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EFTipoMaestros: TFIBHYGEditFind
          Left = 40
          Top = 0
          Width = 46
          Height = 21
          Hint = 'Tipo de Maestro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnChange = EFTipoMaestrosChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TIPO_AUX'
          CampoStr = 'DESC_TIPO_AUX'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'Z_SYS_TIPOS_AUXILIARES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TIPO_AUX')
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 414
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 406
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Top = 45
            DataSource = ZDMMaestros.DSQMTablasMaestras
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_SYS_TABLAS_AUXILIARES'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LblCodigo: TLFLabel
            Left = 48
            Top = 30
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
            FocusControl = DBECodigo
          end
          object LblDescripcion: TLFLabel
            Left = 25
            Top = 52
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object LCantidad: TLFLabel
            Left = 41
            Top = 74
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cantidad'
            FocusControl = DBECantidad
          end
          object LPorcentaje: TLFLabel
            Left = 29
            Top = 97
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Porcentaje'
            FocusControl = DBEPorcentaje
          end
          object DBECodigo: TLFDbedit
            Left = 86
            Top = 26
            Width = 67
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = ZDMMaestros.DSQMTablasMaestras
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 86
            Top = 48
            Width = 269
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMMaestros.DSQMTablasMaestras
            TabOrder = 1
          end
          object DBECantidad: TLFDbedit
            Left = 86
            Top = 70
            Width = 67
            Height = 21
            DataField = 'CANTIDAD'
            DataSource = ZDMMaestros.DSQMTablasMaestras
            TabOrder = 2
          end
          object DBEPorcentaje: TLFDbedit
            Left = 86
            Top = 92
            Width = 67
            Height = 21
            DataField = 'PORCENTAJE'
            DataSource = ZDMMaestros.DSQMTablasMaestras
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 406
          Height = 136
          DataSource = ZDMMaestros.DSQMTablasMaestras
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CANTIDAD'
            'CODIGO'
            'DESCRIPCION'
            'PORCENTAJE')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_AUX'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 310
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 418
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    Left = 348
    Top = 60
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 288
    Top = 64
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 224
    Top = 64
  end
  inherited FSMain: TLFFibFormStorage
    Left = 288
    Top = 32
  end
end
