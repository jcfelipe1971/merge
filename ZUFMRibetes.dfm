inherited ZFMRibetes: TZFMRibetes
  Caption = 'Mantenimiento de Ribetes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = ZDMRibetes.DSQMRibetes
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Width = 52
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 280
      end
      inherited TbuttComp: TToolButton
        Left = 288
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            Left = 169
            Top = 28
            DataSource = ZDMRibetes.DSQMRibetes
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_SYS_RIBETES'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            Entorno = DMMain.EntornoBusqueda
          end
          object LblCodigo: TLFLabel
            Left = 57
            Top = 40
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object LblDescripcion: TLFLabel
            Left = 33
            Top = 62
            Width = 56
            Height = 13
            Caption = 'Descripci'#243'n'
          end
          object LblImagen: TLFLabel
            Left = 54
            Top = 84
            Width = 35
            Height = 13
            Caption = 'Imagen'
          end
          object DBECodigo: TLFDbedit
            Left = 95
            Top = 36
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = ZDMRibetes.DSQMRibetes
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 95
            Top = 58
            Width = 300
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMRibetes.DSQMRibetes
            TabOrder = 1
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 95
            Top = 80
            Width = 50
            Height = 21
            DataField = 'IMAGEN'
            DataSource = ZDMRibetes.DSQMRibetes
            TabOrder = 2
            OnChange = DBEFImagenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IMAGENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object ETituloImagen: TLFEdit
            Left = 146
            Top = 80
            Width = 249
            Height = 21
            TabStop = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object ScrBImagen: TScrollBox
            Left = 95
            Top = 115
            Width = 144
            Height = 130
            BorderStyle = bsNone
            TabOrder = 4
            object Imagen: TImage
              Left = 0
              Top = 0
              Width = 144
              Height = 130
              Align = alClient
              AutoSize = True
              IncrementalDisplay = True
              Stretch = True
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = ZDMRibetes.DSQMRibetes
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 309
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 72
  end
  inherited FSMain: TLFFibFormStorage
    Left = 317
    Top = 72
  end
end
