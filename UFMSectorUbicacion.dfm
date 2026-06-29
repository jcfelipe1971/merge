inherited FMSectorUbicacion: TFMSectorUbicacion
  Left = 743
  Top = 276
  Caption = 'Sectores de Almac'#233'n'
  ClientHeight = 260
  ClientWidth = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 366
    Height = 236
    inherited TBMain: TLFToolBar
      Width = 362
      inherited NavMain: THYMNavigator
        DataSource = DMSectorUbicacion.DSQMSectorUbicacion
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBESector
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 362
      Height = 206
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 354
          Height = 178
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMSectorUbicacion.DSQMSectorUbicacion
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_SECTORES'
            CampoNum = 'SECTOR'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'SECTOR')
          end
          object LSector: TLFLabel
            Left = 29
            Top = 46
            Width = 31
            Height = 13
            Caption = 'Sector'
            FocusControl = DBESector
          end
          object LBLTitulo: TLFLabel
            Left = 23
            Top = 68
            Width = 28
            Height = 13
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBESector: TLFDbedit
            Left = 56
            Top = 42
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SECTOR'
            DataSource = DMSectorUbicacion.DSQMSectorUbicacion
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 56
            Top = 64
            Width = 280
            Height = 21
            DataField = 'TITULO'
            DataSource = DMSectorUbicacion.DSQMSectorUbicacion
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 354
          Height = 178
          DataSource = DMSectorUbicacion.DSQMSectorUbicacion
          Columns = <
            item
              Expanded = False
              FieldName = 'SECTOR'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 268
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 236
    Width = 366
  end
end
