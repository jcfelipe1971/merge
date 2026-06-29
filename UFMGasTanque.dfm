inherited FMGasTanque: TFMGasTanque
  Left = 290
  Top = 245
  Caption = 'Mantenimiento Gas Tanque'
  ClientHeight = 379
  ClientWidth = 520
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 520
    Height = 355
    inherited TBMain: TLFToolBar
      Width = 516
      inherited NavMain: THYMNavigator
        DataSource = DMGasTanque.DSQMGasTanque
        Hints.Strings = ()
        EditaControl = DBECodigo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Width = 69
        VisibleButtons = [neRango, neReport, neSalir]
        Hints.Strings = ()
        Busca01 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 297
      end
      inherited TbuttComp: TToolButton
        Left = 305
      end
    end
    inherited PCMain: TLFPageControl
      Width = 516
      Height = 325
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 508
          Height = 297
          inherited G2KTableLoc: TG2KTBLoc
            Left = 62
            Top = 39
            DataSource = DMGasTanque.DSQMGasTanque
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_GAS_TANQUE'
            CampoNum = 'COD_TANQUE'
            CampoStr = 'TITULO'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'COD_TANQUE')
          end
          object LCodigo: TLFLabel
            Left = 44
            Top = 15
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LLey: TLFLabel
            Left = 49
            Top = 36
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LDescripcion: TLFLabel
            Left = 49
            Top = 166
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LPorcFinanciacion: TLFLabel
            Left = 17
            Top = 58
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Evaporaci'#243'n'
          end
          object LFLCapacidad: TLFLabel
            Left = 26
            Top = 80
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Capacidad'
          end
          object LblAlmSalida: TLFLabel
            Left = 20
            Top = 101
            Width = 57
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Almac'#233'n'
          end
          object LFLArticulo: TLFLabel
            Left = 20
            Top = 123
            Width = 57
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Art'#237'culo'
          end
          object LBLTarifa: TLFLabel
            Left = 50
            Top = 145
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LFSerie: TLFLabel
            Left = 160
            Top = 14
            Width = 29
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Serie'
          end
          object DBETitulo: TLFDbedit
            Left = 81
            Top = 33
            Width = 393
            Height = 21
            DataField = 'TITULO'
            DataSource = DMGasTanque.DSQMGasTanque
            TabOrder = 3
          end
          object DBECodigo: TLFDbedit
            Left = 81
            Top = 11
            Width = 67
            Height = 21
            DataField = 'COD_TANQUE'
            DataSource = DMGasTanque.DSQMGasTanque
            TabOrder = 0
          end
          object DBMNotas: TLFDBMemo
            Left = 81
            Top = 165
            Width = 393
            Height = 82
            DataField = 'NOTAS'
            DataSource = DMGasTanque.DSQMGasTanque
            TabOrder = 9
          end
          object DBEEvaporacion: TLFDbedit
            Left = 81
            Top = 55
            Width = 63
            Height = 21
            DataField = 'EVAPORACION'
            DataSource = DMGasTanque.DSQMGasTanque
            TabOrder = 4
          end
          object LFDCapacidad: TLFDbedit
            Left = 81
            Top = 77
            Width = 63
            Height = 21
            DataField = 'CAPACIDAD'
            DataSource = DMGasTanque.DSQMGasTanque
            TabOrder = 5
          end
          object DBEFAlmacen: TLFDBEditFind2000
            Left = 81
            Top = 99
            Width = 63
            Height = 21
            DataField = 'ALMACEN'
            DataSource = DMGasTanque.DSQMGasTanque
            TabOrder = 6
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBEArticulo: TLFDBEditFind2000
            Left = 81
            Top = 121
            Width = 88
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMGasTanque.DSQMGasTanque
            TabOrder = 7
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFTarifa: TLFDBEditFind2000
            Left = 81
            Top = 143
            Width = 63
            Height = 21
            DataField = 'TARIFA'
            DataSource = DMGasTanque.DSQMGasTanque
            TabOrder = 8
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'activa=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TARIFA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCBEstado: TLFDBCheckBox
            Left = 401
            Top = 13
            Width = 73
            Height = 17
            Caption = 'Estado'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESTADO'
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBESerie: TLFDBEditFind2000
            Left = 193
            Top = 11
            Width = 63
            Height = 21
            DataField = 'SERIE'
            DataSource = DMGasTanque.DSQMGasTanque
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'GEN_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBSerie: TLFDbedit
            Left = 257
            Top = 11
            Width = 143
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescSerie'
            DataSource = DMGasTanque.DSQMGasTanque
            Enabled = False
            ReadOnly = True
            TabOrder = 10
          end
          object LFDBAlmacen: TLFDbedit
            Left = 145
            Top = 99
            Width = 329
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescAlmacen'
            DataSource = DMGasTanque.DSQMGasTanque
            Enabled = False
            ReadOnly = True
            TabOrder = 11
          end
          object LFDBArticulo: TLFDbedit
            Left = 170
            Top = 121
            Width = 304
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArticulo'
            DataSource = DMGasTanque.DSQMGasTanque
            Enabled = False
            ReadOnly = True
            TabOrder = 12
          end
          object LFDBTarifa: TLFDbedit
            Left = 145
            Top = 143
            Width = 329
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescTarifa'
            DataSource = DMGasTanque.DSQMGasTanque
            Enabled = False
            ReadOnly = True
            TabOrder = 13
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 508
          Height = 297
          DataSource = DMGasTanque.DSQMGasTanque
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_TANQUE'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EVAPORACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAPACIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 355
    Width = 520
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEMain
    Top = 29
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 29
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 60
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
  end
end
