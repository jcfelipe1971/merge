inherited FMRemuneraciones: TFMRemuneraciones
  Left = 642
  Top = 207
  Caption = 'Libro de Remuneraciones'
  ClientHeight = 580
  ClientWidth = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 700
    Height = 556
    inherited TBMain: TLFToolBar
      Width = 696
      inherited NavMain: THYMNavigator
        DataSource = DMRemuneraciones.DSQMNomRemu
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    object LFPCabecera: TLFPanel
      Left = 2
      Top = 28
      Width = 696
      Height = 53
      Align = alTop
      TabOrder = 1
      object LPeriodo: TLFLabel
        Left = 20
        Top = 20
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Periodo'
      end
      object DBEFPeriodo: TLFDBEditFind2000
        Left = 62
        Top = 16
        Width = 64
        Height = 21
        AutoSize = False
        DataField = 'PERIODO'
        DataSource = DMNominasCabecera.DSQMNomCab
        TabOrder = 0
        OnChange = DBEFPeriodoChange
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'EMP_PERIODOS'
        Tabla_asociada.DesplegarBusqueda = False
        Campos_Desplegar.Strings = (
          'DESDE'
          'HASTA'
          '')
        CampoNum = 'PERIODO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO=1'
        ReemplazarCaracter = True
        SalirSiNoExiste = False
        SalirSiVacio = True
        OrdenadoPor.Strings = (
          'PERIODO')
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETituloPeriodo: TLFDbedit
        Left = 130
        Top = 16
        Width = 193
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clInfoBk
        DataField = 'TITULO_PERIODO'
        DataSource = DMNominasCabecera.DSQMNomCab
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 81
      Width = 696
      Height = 473
      Align = alClient
      DataSource = DMRemuneraciones.DSQMNomRemu
      TabOrder = 2
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
      Transaction = DMMain.TLocal
      BuscarNums = False
      Campos.Strings = (
        'CODIGO')
      CamposAMostrar.Strings = (
        'CODIGO'
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
        'CODIGO'
        'GLOSA'
        'IMPORTE')
      ColumnasCheckBoxes.Strings = (
        'CALCULABLE'
        'ES_IMPONIBLE')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0')
      MensajeNoExiste = False
      Numericos.Strings = (
        'CODIGO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'SYS_CONCEPTO_PARAMETROS')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'GLOSA')
      Posicion = tpCentrado
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'CODIGO')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPRESA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERIODO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN_IMPRESION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EXPORTAR'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 556
    Width = 700
  end
end
