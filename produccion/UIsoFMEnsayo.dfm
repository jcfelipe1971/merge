inherited IsoFMEnsayo: TIsoFMEnsayo
  Left = 290
  Top = 245
  Caption = 'Mantenimiento Ensayos'
  ClientHeight = 227
  ClientWidth = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 416
    Height = 203
    inherited TBMain: TLFToolBar
      Width = 412
      inherited NavMain: THYMNavigator
        DataSource = IsoDMEnsayo.DSQMIsoEnsayo
        Hints.Strings = ()
        EditaControl = DBETipo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Width = 412
      Height = 173
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 404
          Height = 145
          inherited G2KTableLoc: TG2KTBLoc
            Left = 62
            Top = 59
            CamposADesplegar.Strings = (
              'ISO_NORMATIVAS')
            DataSource = IsoDMEnsayo.DSQMIsoEnsayo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ISO_ENSAYO'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LCodigo: TLFLabel
            Left = 41
            Top = 37
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LTipoEnsayo: TLFLabel
            Left = 15
            Top = 59
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Ensayo'
          end
          object LNormativa: TLFLabel
            Left = 26
            Top = 80
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Normativa'
          end
          object DBETipo: TLFDbedit
            Left = 78
            Top = 33
            Width = 67
            Height = 21
            DataField = 'CODIGO'
            DataSource = IsoDMEnsayo.DSQMIsoEnsayo
            TabOrder = 0
          end
          object DBETipoEnsayo: TLFDBEditFind2000
            Left = 78
            Top = 55
            Width = 67
            Height = 21
            DataField = 'ISO_TIPO_ENSAYO'
            DataSource = IsoDMEnsayo.DSQMIsoEnsayo
            TabOrder = 2
            OnChange = DBETipoEnsayoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ISO_TIPO_ENSAYO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            CampoADevolver = 'CODIGO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object DBEFNormativa: TLFDBEditFind2000
            Left = 78
            Top = 77
            Width = 67
            Height = 21
            DataField = 'ISO_NORMATIVAS'
            DataSource = IsoDMEnsayo.DSQMIsoEnsayo
            TabOrder = 4
            OnChange = DBEFNormativaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ISO_NORMATIVAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'LEY'
            CampoADevolver = 'CODIGO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object ETituloTipoEnsayo: TLFEdit
            Left = 146
            Top = 55
            Width = 250
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
          object ETituloNormativa: TLFEdit
            Left = 146
            Top = 77
            Width = 250
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBEDescripcion: TLFDbedit
            Left = 146
            Top = 33
            Width = 250
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = IsoDMEnsayo.DSQMIsoEnsayo
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 404
          Height = 145
          DataSource = IsoDMEnsayo.DSQMIsoEnsayo
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 172
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISO_TIPO_ENSAYO'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISO_NORMATIVAS'
              Width = 75
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 203
    Width = 416
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEMain
    Top = 29
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 29
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 276
    Top = 88
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
  end
end
