inherited FMEmpresasStock: TFMEmpresasStock
  Left = 411
  Top = 261
  Caption = 'Configuraci'#243'n de Almacenes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Width = 216
        DataSource = DMEmpresasStock.QMDSEmpresas
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBGFEmp
        InsertaControl = DBGFEmp
      end
      inherited TSepNav: TToolButton
        Left = 216
      end
      inherited EPMain: THYMEditPanel
        Left = 224
        Width = 27
        DataSource = DMEmpresasStock.QMDSEmpresas
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 251
      end
      inherited TbuttComp: TToolButton
        Left = 259
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          object DBGFEmp: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 490
            Height = 274
            Align = alClient
            DataSource = DMEmpresasStock.QMDSEmpresas
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            Transaction = DMEmpresasStock.TLocal
            BuscarNums = False
            Campos.Strings = (
              'EMPRESA'
              'EMPRESA_D'
              'ALMACEN'
              'ALMACEN_D'
              'CANAL'
              'CANAL_D')
            CamposAMostrar.Strings = (
              'EMPRESA'
              '0'
              'EMPRESA_D'
              '0'
              'ALMACEN'
              '0'
              'ALMACEN_D'
              '0'
              'CANAL'
              '0'
              'CANAL_D'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0'
              '0'
              '0'
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              ''
              ''
              ''
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1'
              '1'
              '1'
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'ALMACEN'
              'ALMACEN_D'
              'CANAL'
              'CANAL_D'
              'EMPRESA'
              'EMPRESA_D')
            MensajeNoExiste = False
            Numericos.Strings = (
              'EMPRESA'
              'EMPRESA'
              'ALMACEN'
              'ALMACEN'
              'CANAL'
              'CANAL')
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tablas.Strings = (
              'SYS_EMPRESAS'
              'SYS_EMPRESAS'
              'ART_ALMACENES'
              'ART_ALMACENES'
              'GEN_CANALES'
              'GEN_CANALES')
            Acciones.Strings = (
              ''
              ''
              ''
              ''
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFEmpBusqueda
            Planes.Strings = (
              ''
              ''
              ''
              ''
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              ''
              ''
              ''
              ''
              ''
              '')
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'EMPRESA'
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANAL'
                Width = 53
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALMACEN'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMPRESA_D'
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANAL_D'
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALMACEN_D'
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    DataSource = DMEmpresasStock.QMDSEmpresas
    PanelEdicion = nil
    Left = 344
    Top = 65532
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 380
    Top = 65532
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 416
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 448
    Top = 0
  end
end
