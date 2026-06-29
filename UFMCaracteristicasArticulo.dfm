inherited FMCaracteristicasArticulo: TFMCaracteristicasArticulo
  Left = 378
  Top = 258
  Width = 382
  Height = 303
  HelpContext = 293
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Tipos de Art'#237'culo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 372
    Height = 250
    inherited TBMain: TLFToolBar
      Width = 368
      inherited NavMain: THYMNavigator
        DataSource = DMCaracteristicasArticulo.DSQMCaracteristicasArticulo
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      Width = 368
      Height = 220
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 360
          Height = 192
          inherited G2KTableLoc: TG2KTBLoc
            Top = 80
            DataSource = DMCaracteristicasArticulo.DSQMCaracteristicasArticulo
            Tabla_a_buscar = 'ART_CARACTERISTICAS'
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LCodigo: TLFLabel
            Left = 26
            Top = 69
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo'
          end
          object LTitulo: TLFLabel
            Left = 31
            Top = 91
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBETipo: TLFDbedit
            Left = 64
            Top = 65
            Width = 97
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = DMCaracteristicasArticulo.DSQMCaracteristicasArticulo
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 64
            Top = 87
            Width = 281
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TITULO'
            DataSource = DMCaracteristicasArticulo.DSQMCaracteristicasArticulo
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 360
          Height = 192
          DataSource = DMCaracteristicasArticulo.DSQMCaracteristicasArticulo
          CamposAOrdenar.Strings = (
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 253
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 250
    Width = 372
  end
  inherited CEMain: TControlEdit
    Left = 192
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 230
    Top = 38
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 264
    Top = 32
  end
end
