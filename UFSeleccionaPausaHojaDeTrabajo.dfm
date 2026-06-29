inherited FSeleccionaPausaHojaDeTrabajo: TFSeleccionaPausaHojaDeTrabajo
  Caption = 'Selecciona pausa Hoja de Trabajo'
  ClientHeight = 124
  ClientWidth = 413
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 413
    Height = 100
    object LCodigoIncidencia: TLFLabel [0]
      Left = 19
      Top = 48
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object LComentario: TLFLabel [1]
      Left = 0
      Top = 71
      Width = 53
      Height = 13
      Caption = 'Comentario'
    end
    inherited TBMain: TLFToolBar
      Width = 409
      object TBOk: TToolButton [0]
        Left = 0
        Top = 0
        Caption = 'TBOk'
        ImageIndex = 25
        OnClick = TBOkClick
      end
      object ToolButton1: TToolButton [1]
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 31
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object EFCodigoIncidencia: TLFEditFind2000
      Left = 57
      Top = 45
      Width = 55
      Height = 21
      TabOrder = 1
      OnChange = EFCodigoIncidenciaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoADevolver = 'TIPO'
      CampoNum = 'TIPO'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_TIPO_INCIDENCIAS_REP'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloCodigo: TLFEdit
      Left = 114
      Top = 45
      Width = 295
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EComentario: TLFEdit
      Left = 57
      Top = 68
      Width = 353
      Height = 21
      TabOrder = 3
    end
  end
  inherited TBActions: TLFToolBar
    Top = 100
    Width = 413
  end
  inherited CEMain: TControlEdit
    Left = 240
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 276
    Top = 4
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
    Left = 312
    Top = 4
  end
  inherited FSMain: TLFFibFormStorage
    Left = 352
    Top = 4
  end
end
