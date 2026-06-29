inherited FMImportesMaximoPeriodo: TFMImportesMaximoPeriodo
  Caption = 'Importe Maximo Periodo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMImportesMaximoPeriodo.DSQMPeriodos
        Hints.Strings = ()
        EditaControl = DBGMain
        InsertaControl = DBGMain
      end
      inherited EPMain: THYMEditPanel
        Width = 29
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 257
      end
      inherited TbuttComp: TToolButton
        Left = 265
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 498
      Height = 302
      Align = alClient
      DataSource = DMImportesMaximoPeriodo.DSQMPeriodos
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      Campos.Strings = (
        'PERIODO')
      CamposAMostrar.Strings = (
        'PERIODO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'PERIODO')
      MensajeNoExiste = False
      Numericos.Strings = (
        'PERIODO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'EMP_PERIODOS')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      Posicion = tpCentrado
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'PERIODO')
      Filtros = [obEmpresa, obEjercicio]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'PERIODO'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE_MAXIMO_PEDIDOS'
          Width = 127
          Visible = True
        end>
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
end
