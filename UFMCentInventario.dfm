inherited FMCentInventario: TFMCentInventario
  Left = 409
  Top = 302
  HelpContext = 254
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Centros de Inventario'
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
        DataSource = DMCentrosInventario.DSQMCentrosInventario
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEAlmacen
      end
      inherited EPMain: THYMEditPanel
        Width = 40
        Hint = 'Cerrar la ventana'
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 268
        Visible = False
      end
      inherited TbuttComp: TToolButton
        Left = 276
        Hint = 'Muestra la informaci'#243'n del Tercero asociado'
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
            DataSource = DMCentrosInventario.DSQMCentrosInventario
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CON_CENTROS_INVENTARIO'
            CampoNum = 'CENTRO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CENTRO')
          end
          object LBLCentro: TLFLabel
            Left = 21
            Top = 32
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Centro'
          end
          object LBLTitulo: TLFLabel
            Left = 24
            Top = 54
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLTercero: TLFLabel
            Left = 15
            Top = 76
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object DBEAlmacen: TLFDbedit
            Left = 56
            Top = 28
            Width = 31
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CENTRO'
            DataSource = DMCentrosInventario.DSQMCentrosInventario
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 56
            Top = 50
            Width = 312
            Height = 21
            DataField = 'TITULO'
            DataSource = DMCentrosInventario.DSQMCentrosInventario
            TabOrder = 1
          end
          object DBEFTercero: TLFDBEditFind2000
            Left = 56
            Top = 72
            Width = 50
            Height = 21
            DataField = 'TERCERO'
            DataSource = DMCentrosInventario.DSQMCentrosInventario
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_R_SOCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = []
          end
          object DBETitTercero: TLFDbedit
            Left = 107
            Top = 72
            Width = 261
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMCentrosInventario.DSxTerceros
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
          Width = 378
          Height = 136
          DataSource = DMCentrosInventario.DSQMCentrosInventario
          CamposAOrdenar.Strings = (
            'CENTRO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CENTRO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 298
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    Left = 298
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 334
    Top = 0
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 250
    Top = 42
    object AInfoTercero: TAction
      Caption = 'Informaci'#243'n del Tercero'
      Hint = 'Muestra la informaci'#243'n del Tercero asociado'
      ImageIndex = 54
      OnExecute = AInfoTerceroExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 288
    Top = 44
  end
end
