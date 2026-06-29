inherited CrmFMRutas: TCrmFMRutas
  Left = 543
  Top = 328
  Caption = 'Rutas'
  ClientHeight = 218
  ClientWidth = 419
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 419
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 415
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = CrmDMRutas.DSQMRutas
        Hints.Strings = ()
        EditaControl = DBEFAgente
        InsertaControl = DBERuta
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
      end
    end
    inherited PCMain: TLFPageControl
      Width = 415
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 407
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Left = 12
            Top = 9
            DataSource = CrmDMRutas.DSQMRutas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CRM_CONTACTOS_RUTAS'
            CampoNum = 'RUTA'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RUTA')
          end
          object LRuta: TLFLabel
            Left = 51
            Top = 16
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta'
          end
          object LTituloRuta: TLFLabel
            Left = 48
            Top = 59
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LAgente: TLFLabel
            Left = 40
            Top = 38
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object DBETitulo: TLFDbedit
            Left = 80
            Top = 56
            Width = 295
            Height = 21
            DataField = 'TITULO'
            DataSource = CrmDMRutas.DSQMRutas
            TabOrder = 2
          end
          object DBERuta: TLFDbedit
            Left = 80
            Top = 12
            Width = 57
            Height = 21
            DataField = 'RUTA'
            DataSource = CrmDMRutas.DSQMRutas
            TabOrder = 0
          end
          object DBEFAgente: TLFDBEditFind2000
            Left = 80
            Top = 34
            Width = 57
            Height = 21
            DataField = 'AGENTE'
            DataSource = CrmDMRutas.DSQMRutas
            TabOrder = 1
            OnChange = DBEFAgenteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_AGENTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloAgente: TLFEdit
            Left = 138
            Top = 34
            Width = 237
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 407
          Height = 136
          DataSource = CrmDMRutas.DSQMRutas
          CamposAOrdenar.Strings = (
            'AGENTE'
            'RUTA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RUTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 269
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 419
    ButtonWidth = 70
  end
  inherited CEMain: TControlEdit
    Left = 254
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 284
    Top = 34
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 200
    Top = 34
  end
  inherited FSMain: TLFFibFormStorage
    Left = 334
    Top = 34
  end
end
