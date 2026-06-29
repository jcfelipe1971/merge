inherited FMArtSerializacionReg: TFMArtSerializacionReg
  Left = 329
  Top = 288
  Caption = 'Serializaci'#243'n de Art'#237'culos'
  ClientHeight = 422
  ClientWidth = 590
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 398
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = DMArtSerializacionReg.DSQMArtSerializacion
        Hints.Strings = ()
        EditaControl = DMMMNotas
        InsertaControl = DBEFNSerie
        OnClickBefore = NavMainClickBefore
      end
      inherited EPMain: THYMEditPanel
        Width = 23
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
      Width = 586
      Height = 368
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 340
          object LBLCodigo: TLFLabel
            Left = 21
            Top = 17
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LBLNSerie: TLFLabel
            Left = 6
            Top = 39
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Serie'
          end
          object LBLAlmacen: TLFLabel
            Left = 12
            Top = 83
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LBLFechaAlbaran: TLFLabel
            Left = 401
            Top = 17
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha entrada'
          end
          object LBLNotas: TLFLabel
            Left = 25
            Top = 105
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LBLArticulo: TLFLabel
            Left = 16
            Top = 61
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object DBECodigo: TLFDbedit
            Left = 58
            Top = 13
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CODIGO'
            DataSource = DMArtSerializacionReg.DSQMArtSerializacion
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEAlmacen: TLFDbedit
            Left = 58
            Top = 79
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ALMACEN'
            DataSource = DMArtSerializacionReg.DSQMArtSerializacion
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
          object DBEFecha: TLFDbedit
            Left = 474
            Top = 13
            Width = 71
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FECHA'
            DataSource = DMArtSerializacionReg.DSQMArtSerializacion
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
          object DBETitAlmacen: TLFDbedit
            Left = 180
            Top = 79
            Width = 365
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArtSerializacionReg.DSxAlmacenes
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
          object DMMMNotas: TLFDBMemo
            Left = 58
            Top = 101
            Width = 487
            Height = 89
            DataField = 'NOTAS'
            DataSource = DMArtSerializacionReg.DSQMArtSerializacion
            TabOrder = 7
          end
          object GBFechas: TGroupBox
            Left = 58
            Top = 198
            Width = 242
            Height = 125
            Caption = 'Fechas'
            TabOrder = 8
            object LBLFechaCaducidad: TLFLabel
              Left = 34
              Top = 32
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Caducidad'
            end
            object LBLGarantiaCli: TLFLabel
              Left = 24
              Top = 54
              Width = 94
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fin Garant'#237'a Cliente'
            end
            object LBLFinGarantiaProv: TLFLabel
              Left = 31
              Top = 76
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fin Garant'#237'a Prov.'
            end
            object DBDTPGarProv: TLFDBDateEdit
              Left = 122
              Top = 72
              Width = 87
              Height = 21
              DataField = 'FECHA_GARANTIA_PROVEEDOR'
              DataSource = DMArtSerializacionReg.DSQMArtSerializacion
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 2
            end
            object DBDTPFechaCad: TLFDBDateEdit
              Left = 122
              Top = 28
              Width = 87
              Height = 21
              DataField = 'FECHA_CADUCIDAD'
              DataSource = DMArtSerializacionReg.DSQMArtSerializacion
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
            object DBDTPGarCliente: TLFDBDateEdit
              Left = 122
              Top = 50
              Width = 87
              Height = 21
              DataField = 'FECHA_GARANTIA_CLIENTE'
              DataSource = DMArtSerializacionReg.DSQMArtSerializacion
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
          end
          object GBBarras: TGroupBox
            Left = 304
            Top = 198
            Width = 241
            Height = 125
            Caption = 'C'#243'digo de barras'
            TabOrder = 9
            object ICodBarras: TImage
              Left = 12
              Top = 15
              Width = 209
              Height = 101
            end
          end
          object DBEArticulo: TLFDbedit
            Left = 58
            Top = 57
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = DMArtSerializacionReg.DSQMArtSerializacion
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
          object DBETitArticulo: TLFDbedit
            Left = 180
            Top = 57
            Width = 365
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMArtSerializacionReg.DSxArticulos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEFNSerie: TLFDBEditFind2000
            Left = 58
            Top = 35
            Width = 121
            Height = 21
            DataField = 'NSERIE'
            DataSource = DMArtSerializacionReg.DSQMArtSerializacion
            TabOrder = 1
            OnChange = DBEFNSerieChange
            OnKeyDown = DBEFNSerieKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            BuscarChar = False
            Tabla_a_buscar = 'ART_ARTICULOS_SERIALIZACION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'NSERIE'
            CampoStr = 'NSERIE'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFNSerieBusqueda
            OrdenadoPor.Strings = (
              'NSERIE')
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 340
          DataSource = DMArtSerializacionReg.DSQMArtSerializacion
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ControlEdit = CEMain
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSERIE'
              Width = 127
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 193
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CADUCIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_GARANTIA_CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_GARANTIA_PROVEEDOR'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 590
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Left = 296
    Top = 184
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 348
    Top = 184
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
    Left = 502
    Top = 2
    object ARestoSeries: TAction
      Category = 'Procesos'
      Caption = 'A'#241'adir los n'#250'meros de series que faltan'
      Hint = 'A'#241'adir los n'#250'meros de series que faltan'
      ImageIndex = 115
      OnExecute = ARestoSeriesExecute
    end
    object AAnyadirEtiquetas: TAction
      Category = 'Procesos'
      Caption = 'A'#241'adir las etiquetas seleccionadas para su impresi'#243'n'
      Hint = 'A'#241'adir las etiquetas seleccionadas para su impresi'#243'n'
      ImageIndex = 95
      OnExecute = AAnyadirEtiquetasExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AImpresion: TAction
      Category = 'Listados'
      Caption = 'Mantenimiento de impresi'#243'n de C'#243'digos de Barras'
      Hint = 'Mantenimiento de impresi'#243'n de C'#243'digos de Barras'
      ImageIndex = 38
      OnExecute = AImpresionExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 540
    Top = 4
  end
  object CodBarras: TCodeBar
    Alto = 100
    OrigenY = 0
    OrigenX = 0
    Modulo = 1
    Ratio = 2
    Tipo = cb128
    ChequearDigito = False
    TipoChequeo = csmModulo10
    Porcentaje = 20
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'MS Sans Serif'
    Fuente.Style = []
    DigitoControl = ' '
    Left = 398
    Top = 285
  end
end
