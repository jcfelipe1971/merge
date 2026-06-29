inherited FMPresenciaFichar: TFMPresenciaFichar
  Width = 623
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Fichar registro de presencia'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 613
    Height = 177
    Align = alTop
    object LCodigoTarjeta: TLFLabel [0]
      Left = 34
      Top = 48
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo Tarjeta'
    end
    object LIncidencia: TLFLabel [1]
      Left = 54
      Top = 91
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Incidencia'
    end
    object LEmpleado: TLFLabel [2]
      Left = 53
      Top = 70
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Empleado'
    end
    inherited TBMain: TLFToolBar
      Width = 609
      TabOrder = 7
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object ECodigoTarjeta: TLFEdit
      Left = 108
      Top = 45
      Width = 165
      Height = 21
      TabOrder = 0
      OnChange = ECodigoTarjetaChange
    end
    object BEntrada: TButton
      Tag = 1
      Left = 110
      Top = 115
      Width = 75
      Height = 50
      Caption = 'Entrada'
      TabOrder = 5
      OnClick = BMarcajeClick
    end
    object BSalida: TButton
      Tag = 2
      Left = 198
      Top = 115
      Width = 75
      Height = 50
      Caption = 'Salida'
      TabOrder = 6
      OnClick = BMarcajeClick
    end
    object EEmpleado: TLFEdit
      Left = 108
      Top = 67
      Width = 85
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      OnChange = EEmpleadoChange
    end
    object EENombreEmpleado: TLFEdit
      Left = 194
      Top = 67
      Width = 309
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object EFIncidencia: TLFEditFind2000
      Left = 109
      Top = 89
      Width = 85
      Height = 21
      TabOrder = 3
      OnChange = EFIncidenciaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ID_INCIDENCIA'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'PRO_SYS_TIPO_INCIDENCIA'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ID_INCIDENCIA')
      Filtros = []
    end
    object EIncidencia: TLFEdit
      Left = 194
      Top = 89
      Width = 309
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object BMarcaje: TButton
      Left = 286
      Top = 115
      Width = 75
      Height = 50
      Caption = 'Marcar'
      TabOrder = 8
      OnClick = BMarcajeClick
    end
  end
  inherited TBActions: TLFToolBar
    Width = 613
  end
  object PNLRegistro: TLFPanel [2]
    Left = 0
    Top = 177
    Width = 613
    Height = 155
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = PNLRegistroResize
    object DBGPresencia: TNsDBGrid
      Left = 0
      Top = 0
      Width = 320
      Height = 155
      Align = alLeft
      Color = clInfoBk
      DataSource = DMPresenciaFichar.DSxPresencia
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGPresenciaDrawColumnCell
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_ENTRADA'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_SALIDA'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIEMPO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 150
          Visible = True
        end>
    end
    object DBGMarcajes: TNsDBGrid
      Left = 320
      Top = 0
      Width = 293
      Height = 155
      Align = alClient
      Color = clInfoBk
      DataSource = DMPresenciaFichar.DSxMarcaje
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGMarcajesDrawColumnCell
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA_MARCAJE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_MARCAJE'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 150
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    Left = 288
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 328
    Top = 8
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
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Top = 8
  end
end
