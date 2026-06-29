inherited FMPostizos: TFMPostizos
  Caption = 'Mantenimiento de Postizos'
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
        DataSource = DMPostizos.DSQMPostizos
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEDescripcion
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Visible = False
      end
      inherited TbuttComp: TToolButton
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
            Left = 48
            Top = 5
          end
          object LblNumPostizo: TLFLabel
            Left = 7
            Top = 41
            Width = 62
            Height = 13
            Caption = 'N'#250'm. Postizo'
          end
          object LFLabel2: TLFLabel
            Left = 20
            Top = 86
            Width = 48
            Height = 13
            Caption = 'Ubicaci'#243'n'
          end
          object LblDescripcion: TLFLabel
            Left = 12
            Top = 65
            Width = 56
            Height = 13
            Caption = 'Descripci'#243'n'
          end
          object DBENumPostizo: TLFDbedit
            Left = 72
            Top = 38
            Width = 56
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NUM_POSTIZO'
            DataSource = DMPostizos.DSQMPostizos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 72
            Top = 60
            Width = 169
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMPostizos.DSQMPostizos
            TabOrder = 1
          end
          object DBEFUbicacion: TLFDBEditFind2000
            Left = 72
            Top = 82
            Width = 56
            Height = 21
            DataField = 'ID_UBICACION'
            DataSource = DMPostizos.DSQMPostizos
            TabOrder = 2
            OnChange = DBEFUbicacionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_UBICACION'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ID_UBICACION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescUbicacion: TLFHYDBDescription
            Left = 129
            Top = 82
            Width = 241
            Height = 21
            Color = clInfoBk
            DataSource = DMPostizos.DSQMPostizos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'ID_UBICACION')
            CamposWhereTabla.Strings = (
              'ID_UBICACION')
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMPostizos.DSQMPostizos
          Columns = <
            item
              Expanded = False
              FieldName = 'NUM_POSTIZO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_UBICACION'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
  end
  inherited ALMain: TLFActionList
    Left = 184
  end
  inherited FSMain: TLFFibFormStorage
    Left = 224
  end
end
