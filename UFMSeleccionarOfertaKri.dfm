object FMSeleccionarOfertaKri: TFMSeleccionarOfertaKri
  Left = 502
  Top = 416
  Width = 399
  Height = 169
  ActiveControl = EFSerie
  Caption = 'Seleccionar Oferta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PNLTop: TLFPanel
    Left = 0
    Top = 0
    Width = 391
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object BImportar: TButton
      Left = 5
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Importar'
      ModalResult = 1
      TabOrder = 0
    end
    object BCancelar: TButton
      Left = 86
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object PNLMain: TLFPanel
    Left = 0
    Top = 33
    Width = 391
    Height = 109
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      391
      109)
    object LSerie: TLFLabel
      Left = 16
      Top = 16
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie'
    end
    object LOferta: TLFLabel
      Left = 11
      Top = 39
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Oferta'
    end
    object ESerie: TLFEdit
      Left = 116
      Top = 11
      Width = 271
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
    object EFSerie: TLFEditFind2000
      Left = 45
      Top = 11
      Width = 70
      Height = 21
      TabStop = False
      AutoSize = False
      TabOrder = 0
      OnChange = EFSerieChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'SERIE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CANALES_SERIES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'SERIE')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFOferta: TLFEditFind2000
      Left = 45
      Top = 34
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 1
      OnChange = EFOfertaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      Campos_Desplegar.Strings = (
        'EJERCICIO'
        'SERIE'
        'RIG')
      CampoADevolver = 'ID_S'
      CampoNum = 'RIG'
      CampoStr = 'SU_REFERENCIA'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'VER_CABECERAS_OFERTA_C'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'RIG, EJERCICIO')
      Filtros = [obEmpresa, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object CBMantenerPreciosYDescuentos: TLFCheckBox
      Left = 45
      Top = 61
      Width = 344
      Height = 17
      Caption = 'Mantener Precios y Descuentos'
      ClicksDisabled = False
      TabOrder = 2
      TabStop = True
      Anchors = [akLeft, akTop, akRight]
      Alignment = taLeftJustify
    end
    object EOferta: TLFEdit
      Left = 116
      Top = 34
      Width = 271
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 4
    end
    object CBAgregarAlFinal: TLFCheckBox
      Left = 45
      Top = 80
      Width = 344
      Height = 17
      Caption = 'Agregar al final del documento'
      ClicksDisabled = False
      TabOrder = 5
      TabStop = True
      Anchors = [akLeft, akTop, akRight]
      Alignment = taLeftJustify
    end
  end
end
