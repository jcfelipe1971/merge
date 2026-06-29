inherited ProFMOrdTareaMat: TProFMOrdTareaMat
  Left = 421
  Top = 275
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Tareas Realizadas'
  ClientHeight = 564
  ClientWidth = 790
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 142
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        DataSource = ProDMOrdTareaMat.DSTareaMatCab
        Hints.Strings = ()
        EditaControl = LFDBTarea
        InsertaControl = LFDBTarea
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    inherited PCMain: TLFPageControl
      Width = 786
      Height = 112
      inherited TSFicha: TTabSheet
        object SBAOrden: TSpeedButton [0]
          Left = 420
          Top = 28
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAOrdenDblClick
        end
        inherited PEdit: TLFPanel
          Width = 778
          Height = 84
          object LTarea: TLFLabel
            Left = 21
            Top = 11
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarea'
          end
          object LFase: TLFLabel
            Left = 26
            Top = 33
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fase'
          end
          object LOrden: TLFLabel
            Left = 20
            Top = 55
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object LFDBTarea: TLFDBEditFind2000
            Left = 54
            Top = 7
            Width = 50
            Height = 21
            DataField = 'ID_TAREA'
            DataSource = ProDMOrdTareaMat.DSTareaMatCab
            TabOrder = 0
            OnChange = LFDBTareaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_VER_TAREAS_ABIERTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'IDENTIFICADOR'
            CampoStr = 'TITULO_TAREA'
            CondicionBusqueda = 'situacion>=1 and situacion<=3'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'IDENTIFICADOR')
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescTarea: TLFHYDBDescription
            Left = 105
            Top = 7
            Width = 347
            Height = 21
            Color = clInfoBk
            DataSource = ProDMOrdTareaMat.DSTareaMatCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Tabla_a_buscar = 'PRO_VER_TAREAS_ABIERTAS'
            Campo_Descripcion = 'TITULO_TAREA'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'ID_TAREA')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'IDENTIFICADOR')
          end
          object LFDBFase: TLFDbedit
            Left = 54
            Top = 29
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIPOFASE'
            DataSource = ProDMOrdTareaMat.DSTareaMatCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEOrden: TLFDbedit
            Left = 54
            Top = 51
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_ORDEN'
            DataSource = ProDMOrdTareaMat.DSTareaMatCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEDescripcionFase: TLFDbedit
            Left = 105
            Top = 29
            Width = 347
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescFase'
            DataSource = ProDMOrdTareaMat.DSTareaMatCab
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEDescOrden: TLFDbedit
            Left = 192
            Top = 51
            Width = 260
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMOrdTareaMat.DSxOrden
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object DBECompuesto: TLFDbedit
            Left = 105
            Top = 51
            Width = 86
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'COMPUESTO'
            DataSource = ProDMOrdTareaMat.DSxOrden
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 778
          Height = 84
          DataSource = ProDMOrdTareaMat.DSTareaMatCab
          Columns = <
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_TAREA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOFASE'
              Width = 54
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 142
    Width = 790
    Height = 398
    inherited TBDetalle: TLFToolBar
      Width = 790
      inherited NavDetalle: THYMNavigator
        DataSource = ProDMOrdTareaMat.DSTareaMatDet
        Hints.Strings = ()
        InsertaUltimo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 790
      Height = 376
      DataSource = ProDMOrdTareaMat.DSTareaMatDet
      ColumnaInicial = 2
      Campos.Strings = (
        'ARTICULO'
        'OPERARIO')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '0'
        'OPERARIO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1')
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'OPERARIO')
      Numericos.Strings = (
        'ARTICULO'
        'EMPLEADO')
      Tablas.Strings = (
        'VER_ARTICULOS'
        'VER_EMPLEADOS_EF')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TITULO')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        '')
      OrdenadosPor.Strings = (
        'ARTICULO'
        'EMPLEADO')
      Filtros = [obEmpresa]
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA'
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OPERARIO'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescOperario'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescArticulo'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 540
    Width = 790
  end
  inherited ALMain: TLFActionList
    Left = 372
    Top = 20
    object AAOrden: TAction
      Category = 'Procesos'
      Caption = 'Abrir OP'
      OnExecute = AAOrdenExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 436
    Top = 16
  end
end
