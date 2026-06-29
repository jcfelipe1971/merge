inherited FMNomConceptosCHL: TFMNomConceptosCHL
  Left = 297
  Top = 216
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Conceptos N'#243'minas'
  ClientHeight = 646
  ClientWidth = 1222
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1222
    Height = 622
    inherited TBMain: TLFToolBar
      Width = 1218
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 1218
      Height = 592
      ActivePage = TSParametros
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSParametros: TTabSheet
        Caption = 'Parametros'
        object PNLParametros: TLFPanel
          Left = 0
          Top = 0
          Width = 1210
          Height = 564
          Align = alClient
          TabOrder = 0
          object TBParametros: TLFToolBar
            Left = 1
            Top = 1
            Width = 1208
            Height = 29
            TabOrder = 0
            Separators = True
            object NavParametros: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMNomConceptosCHL.DSQMParametro
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGFParametros: TDBGridFind2000
            Left = 1
            Top = 30
            Width = 1208
            Height = 533
            Align = alClient
            DataSource = DMNomConceptosCHL.DSQMParametro
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
              'CODIGO'
              'CUENTA')
            CamposAMostrar.Strings = (
              'CODIGO'
              '0'
              'CUENTA'
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
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'CODIGO'
              'GLOSA'
              'IMPORTE'
              'CALCULABLE'
              'ES_IMPONIBLE'
              'MOSTRAR_IMPRESION'
              'CUENTA'
              'SIGNO')
            ColumnasCheckBoxes.Strings = (
              'CALCULABLE'
              'ES_IMPONIBLE'
              'ES_TOTAL'
              'MOSTRAR_IMPRESION'
              'VISIBLE_EN_EMPLEADO')
            ColumnasChecked.Strings = (
              '1'
              '1'
              '1'
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              '0'
              '0'
              '0'
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'CODIGO'
              'CUENTA')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'EMP_CONCEPTO_PARAMETROS'
              'CON_CUENTAS')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'GLOSA'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFParametrosBusqueda
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'CODIGO'
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'EMPRESA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'EJERCICIO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CANAL'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CODIGO'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GLOSA'
                Width = 400
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CUENTA'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SIGNO'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CALCULABLE'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_DATO'
                PickList.Strings = (
                  'N'
                  'T'
                  'F')
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN_IMPRESION'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ES_TOTAL'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VISIBLE_EN_EMPLEADO'
                Width = 70
                Visible = True
              end              
              item
                Expanded = False
                FieldName = 'TIPO_PARAMETRO'
                Visible = True
              end>
          end
        end
      end
      object TSHaberes: TTabSheet
        Caption = 'Haberes'
        ImageIndex = 1
        object PNLHaberes: TLFPanel
          Left = 0
          Top = 0
          Width = 1210
          Height = 564
          Align = alClient
          TabOrder = 0
          object TBHaberes: TLFToolBar
            Left = 1
            Top = 1
            Width = 1208
            Height = 29
            TabOrder = 0
            Separators = True
            object NAVHaberes: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMNomConceptosCHL.DSQMHaber
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGFHaberes: TDBGridFind2000
            Left = 1
            Top = 30
            Width = 1208
            Height = 533
            Align = alClient
            DataSource = DMNomConceptosCHL.DSQMHaber
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
              'CODIGO'
              'CUENTA')
            CamposAMostrar.Strings = (
              'CODIGO'
              '0'
              'CUENTA'
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
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'CODIGO'
              'GLOSA'
              'IMPORTE'
              'CALCULABLE'
              'ES_IMPONIBLE'
              'MOSTRAR_IMPRESION'
              'CUENTA'
              'SIGNO')
            ColumnasCheckBoxes.Strings = (
              'CALCULABLE'
              'ES_IMPONIBLE'
              'ES_TOTAL'
              'MOSTRAR_IMPRESION'
              'VISIBLE_EN_EMPLEADO')
            ColumnasChecked.Strings = (
              '1'
              '1'
              '1'
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              '0'
              '0'
              '0'
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'CODIGO'
              'CUENTA')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'EMP_CONCEPTO_HABERES'
              'CON_CUENTAS')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'GLOSA'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFHaberesBusqueda
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'CODIGO'
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GLOSA'
                Width = 400
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CUENTA'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SIGNO'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CALCULABLE'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ES_IMPONIBLE'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOSTRAR_IMPRESION'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN_IMPRESION'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ES_TOTAL'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VISIBLE_EN_EMPLEADO'
                Width = 70
                Visible = True
              end>
          end
        end
      end
      object TSDescuentos: TTabSheet
        Caption = 'Descuentos'
        ImageIndex = 2
        object PNLDescuentos: TLFPanel
          Left = 0
          Top = 0
          Width = 1210
          Height = 564
          Align = alClient
          TabOrder = 0
          object TBDescuentos: TLFToolBar
            Left = 1
            Top = 1
            Width = 1208
            Height = 29
            TabOrder = 0
            Separators = True
            object NAVDescuentos: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMNomConceptosCHL.DSQMDescuento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGFDescuentos: TDBGridFind2000
            Left = 1
            Top = 30
            Width = 1208
            Height = 533
            Align = alClient
            DataSource = DMNomConceptosCHL.DSQMDescuento
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
            BuscarNums = False
            Campos.Strings = (
              'CODIGO'
              'CUENTA')
            CamposAMostrar.Strings = (
              'CODIGO'
              '0'
              'CUENTA'
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
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'CODIGO'
              'GLOSA'
              'IMPORTE'
              'CALCULABLE'
              'MOSTRAR_IMPRESION'
              'CUENTA'
              'VISIBLE_EN_EMPLEADO'
              'ES_PERSONAL'
              'SIGNO')
            ColumnasCheckBoxes.Strings = (
              'CALCULABLE'
              'ES_PERSONAL'
              'ES_TOTAL'
              'MOSTRAR_IMPRESION'
              'VISIBLE_EN_EMPLEADO')
            ColumnasChecked.Strings = (
              '1'
              '1'
              '1'
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              '0'
              '0'
              '0'
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'CODIGO'
              'CUENTA')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'EMP_CONCEPTO_DESCUENTOS'
              'CON_CUENTAS')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'GLOSA'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFDescuentosBusqueda
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'CODIGO'
              '')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GLOSA'
                Width = 400
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CUENTA'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SIGNO'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CALCULABLE'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ES_PERSONAL'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOSTRAR_IMPRESION'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN_IMPRESION'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ES_TOTAL'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VISIBLE_EN_EMPLEADO'
                Width = 70
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 622
    Width = 1222
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
